class Word
  def initialize(word)
    @word = word
  end

  def correct?
    return false if mixed_case?
    matches.include? @word.downcase
  end

  def matches
    return [] unless valid_word? # this may degrade performance with small dictionary
    word = @word.downcase
    @matches ||= Dictionary.words.select do |dictionary_word|
      match?(word, dictionary_word)
    end
  end

  private

  def valid_word?
    !@word.blank? && contains_only_alpha?
  end

  # do these two words match based on given rules? (see exercise_sheet.txt)
  def match?(search_word, dictionary_word)
    search_word_index = 0
    dictionary_word_index = 0

    until search_word[search_word_index].nil? && dictionary_word[dictionary_word_index].nil?
      # current indexes match
      if dictionary_word[dictionary_word_index] == search_word[search_word_index]
        search_word_index += 1; dictionary_word_index += 1; next
      # search word index is a duplicate letter but not the current dict word index
      elsif search_word[search_word_index] == search_word[search_word_index-1]
        search_word_index += 1; next
      # dict word index is a vowel but not the current search word index
      elsif dictionary_word[dictionary_word_index] =~ /[aeiou]/
        dictionary_word_index += 1; next
      # no acceptable path forward was found, word is not a match
      else
        return false
      end
    end

    true
  end

  def contains_only_alpha?
    @word.gsub(/[A-Za-z]/, '').length == 0
  end

  def mixed_case?
    return false if @word.length == 1
    return true if first_letter_lower? && other_letters_upper?
    return true if other_letters_upper? && other_letters_lower?
    false
  end

  def first_letter_lower?
    @word[0] == @word[0].downcase
  end

  def other_letters_upper?
    @word[1..-1] =~ /[A-Z]/
  end

  def other_letters_lower?
    @word[1..-1] =~ /[a-z]/
  end
end
