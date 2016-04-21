class School
  attr_accessor :school

  def initialize
    @school = {}
  end


  def add(name, grade)
    if @school.keys.include?(grade)
      @school[grade] << name
    else
      @school[grade] = [name]
    end
  end

  def to_h
    alpha = @school.sort_by { |k,v| v.sort!}.to_h
    alpha.sort.to_h
  end

  def grade(num)
    @school[num] ? @school[num] : []
  end



end

scho = School.new
scho.add('Kelley', 3)
scho.add('Dan', 3)
scho.add("Bill", 3)
p scho.to_h