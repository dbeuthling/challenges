class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_array)
    word_array.select do |_word|
      _word.downcase.chars.sort == @word.downcase.chars.sort &&
      @word.downcase != _word.downcase
    end
  end
end
