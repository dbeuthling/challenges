class School
  def initialize
    @roster = {}
  end

  def add(name, grade)
    @roster[grade] = [] unless @roster[grade]
    (@roster[grade] << name).sort!
  end

  def to_h
    @roster.sort.to_h
  end

  def grade(num)
    @roster[num] || []
  end
end
