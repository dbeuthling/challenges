class Cipher
  ALPHA = ('a'..'z').to_a + ('a'..'z').to_a
  KEYS = (0..51).to_a
  HASH = Hash[KEYS.zip ALPHA]
  attr_reader :key

  def initialize(key = ALPHA.shuffle.join)
    raise ArgumentError.new("key must be lowercase letters") if key == '' || /[^a-z]+/ =~ key
    @key = key
  end

  def key_array
    @key.chars.map { |char| HASH.key(char) }
  end

  def correct_key_length(text)
    key_array[0, text.length]
  end

  def encode(plaintext)
    encoded = []
    sized_key = correct_key_length(plaintext)
    orig = plaintext.chars.map { |char| HASH.key(char) }
    sized_key.each_index { |i| encoded[i] = orig[i] + sized_key[i] }
    encoded.map { |num| HASH[num]}.join
  end

  def decode(encoded_text)
    decoded = []
    sized_key = correct_key_length(encoded_text)
    orig = encoded_text.chars.map { |char| HASH.key(char) }
    sized_key.each_index { |i| decoded[i] = orig[i] - sized_key[i] }
    decoded.map { |num| HASH[num + 26]}.join
  end
end
