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
      return if str.nil?
      _index = @buffer.index(["#{@in_order[0]}"])
      @buffer[_index] = [str]
      @in_order.delete_at(0)
      @in_order << str
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
