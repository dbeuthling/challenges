class Anagram
  def initialize(word)
    @word = word
    @anagrams = []
  end


  def find_all(words)
    words.select do |word|
      word.downcase!
      word.length == @word.length && word.chars.sort == @word.downcase.chars.sort && @word != word
    end
  end

  def match(word_array)
    @anagrams << find_all(word_array)
    @anagrams.flatten!.sort!.uniq
    @anagrams.each do |ana|
      ana.capitalize! if @word.chars.first.match(/[A-Z]/) != nil
    end
  end

end

# detector = Anagram.new('ant')
# p detector.match(%w(tdd stand at the))