class PigLatin
  # def initialize(word)
  #   @word = word
  # end

  def self.start_with_vowel?(word)
    word.slice(0).match(/[aeiou]/) || word.slice(0..1).match(/xr|yt/)
  end

  def self.start_with_combo2?(word)
    word.slice(0..1).match(/qu|th|ch/)
  end

  def self.start_with_combo3?(word)
    word.slice(0..2).match(/.qu|str|sch|thr/)
    
  end

  def self.translate(words)
    phrase = []
    words.split.each do |wrd|
      if start_with_vowel?(wrd)
        phrase << wrd + 'ay' 
      elsif start_with_combo3?(wrd)
        phrase << wrd + wrd.slice!(0..2) + 'ay'
      elsif start_with_combo2?(wrd)
        phrase << wrd + wrd.slice!(0..1) + 'ay'
      else
        phrase << wrd + wrd.slice!(0) + 'ay'
      end
    end
    phrase.join(' ')
  end
end
