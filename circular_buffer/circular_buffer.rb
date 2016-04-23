class CircularBuffer
  BufferEmptyException = 'the buffer is empty'
  BufferFullException = 'the buffer is full'

  def initialize(num)
    @buffer = Array.new(num) { Array.new }
    @in_order = []
  end

  def read
    raise BufferEmptyException if @buffer.flatten.empty?
    counter = 0
    oldest = ''
    loop do
      if @in_order[counter] == nil
        counter += 1
      else
        @in_order[counter]
        oldest = @in_order[counter]
        @in_order.slice!(counter)
        @buffer[@buffer.index([oldest])] = []
        break
      end
    end
    return oldest
  end

  def write(str)
    raise BufferFullException if !@buffer.include?([])
    buffer_writes_in_order(str)
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

  def write!(str)
    if  @buffer.include?([])
      write(str)
    else
      _index = @buffer.index(["#{@in_order[0]}"])
      @buffer[_index] = [str] unless str == nil
      @in_order.delete_at(0) unless str == nil
      @in_order << str unless str == nil
    end
  end

  def clear
    @in_order = []
    @buffer.each { |buff| buff.delete_if { |buf| buf.nil? || !buf.empty? } }
  end

  def buffer_writes_in_order(write)
    @in_order << write
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

# buffer = CircularBuffer.new(5)
# ('1'..'3').each { |i| buffer.write i }
# p buffer
# buffer.write!('six')
# p buffer


# buffer = CircularBuffer.new(3)
# buffer.write '1'
# buffer.write '2'
# buffer.write nil
# p buffer
# buffer.read
# p buffer
# buffer.write! 'A'
# p buffer
# buffer.read
# p buffer
# assert_equal 'A', buffer.read