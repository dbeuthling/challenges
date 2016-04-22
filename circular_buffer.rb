class CircularBuffer
  BufferEmptyException = 'the buffer is empty'

  def initialize(num)
    @buffer = Array.new(num) { Array.new }
  end

  def read
    raise BufferEmptyException if @buffer.flatten.empty?
    counter = 0
    # p @buffer[counter][0]
    loop do
      if @buffer[counter][0].nil?
        p "yes"
        counter += 1
      else
        return (@buffer.slice!(counter))[0]
        break
      end
    end

  end

  def write(str)
    counter = 0
    loop do 
      if @buffer[counter].empty?
        @buffer[counter] << str
        break
      else
        counter += 1
      end
    end
  end

  def clear
    @buffer.each { |buff| buff.delete_if { |buf| buf.nil? || !buf.empty? } }
  end
end

# p new = CircularBuffer.new(2)
# new.write(nil)
# new.write('2')
# p new
# new.clear
# p new
# puts new.read
# p new

buffer = CircularBuffer.new(5)
buffer.write nil
('1'..'3').each { |i| buffer.write i }
p buffer
p buffer.read