require 'test_helper'

describe Word do
  describe 'matches' do
    it 'does not return matches for "dua"' do
      expect(Word.new('dua').matches).must_be_empty
    end

    it 'does not return matches for "fsiuyflusyifys"' do
      expect(Word.new('fsiuyflusyifys').matches).must_be_empty
    end

    it 'returns matches for "dul"' do
      word = Word.new('dul')
      # early version also (incorrectly) matched "duello" and "dull"
      expect(word.matches.sort).must_equal(%w(dual duel))
    end

    it 'returns matches for "that"' do
      expect(Word.new('that').matches).wont_be_empty
    end

    it 'returns matches for "BlllLLlln"' do
      expect(Word.new('BlllLLlln').matches).wont_be_empty
    end

    it 'returns matches for "BAllOOn"' do
      expect(Word.new('BAllOOn').matches).wont_be_empty
    end

    it 'does not return matches for "1that"' do
      expect(Word.new('1that').matches).must_be_empty
    end

    it 'does not return matches for "that1"' do
      expect(Word.new('that1').matches).must_be_empty
    end

    it 'does not return matches for "that thing"' do
      expect(Word.new('that thing').matches).must_be_empty
    end

    it 'does not return matches for ""' do
      expect(Word.new('').matches).must_be_empty
    end
  end

  describe 'correct?' do
    it 'returns false for "ThAt"' do
      expect(Word.new('ThAt').correct?).must_equal false
    end

    it 'returns true for "A"' do
      expect(Word.new('A').correct?).must_equal true
    end

    it 'returns true for "a"' do
      expect(Word.new('a').correct?).must_equal true
    end

    it 'returns false for "tHat"' do
      expect(Word.new('tHat').correct?).must_equal false
    end

    it 'returns false for "tHAT"' do
      expect(Word.new('tHAT').correct?).must_equal false
    end

    it 'returns true for "That"' do
      expect(Word.new('That').correct?).must_equal true
    end

    it 'returns true for "that"' do
      expect(Word.new('that').correct?).must_equal true
    end
  end
end
