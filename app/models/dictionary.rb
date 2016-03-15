require 'open-uri'

class Dictionary
  @@words ||= open(Rails.configuration.dictionary_location).readlines.map(&:chomp)

  def self.words
    @@words
  end
end
