class Cipher
  ALPHA = ('a'..'z').to_a
  KEYS = (0..25).to_a
  HASH = Hash[ALPHA.zip KEYS]

  attr_reader :key

  def initialize(key = 'lkhlakjhlgrulhgoiuhgocmunvhiwwuvnowvuoiwuhnvi')
    raise ArgumentError.new("lower") if key == '' || /[^a-z]+/ =~ key
    @key = key
  end

  def key_array
    @key.chars.map { |char| Cipher::HASH[char] }
  end

  def encode(str)
    coded = []
    sized_key = key_array[0, str.length]
    orig = str.chars.map { |char| Cipher::HASH[char] }
    sized_key.each_index { |i| coded[i] = sized_key[i] + orig[i] }
    coded.map { |num| Cipher::HASH.key(num)}.join
  end

  def decode(str)
    coded = []
    sized_key = key_array[0, str.length]
    orig = str.chars.map { |char| Cipher::HASH[char] }
    sized_key.each_index { |i| coded[i] = orig[i] - sized_key[i] }
    coded.map { |num| Cipher::HASH.key(num)}.join
  end




end


# new = Cipher.new("adabcdabcdabdbcdacccc")
# p new.encode("iamapandabear")
# p new.decode("idmbrdneceebu")