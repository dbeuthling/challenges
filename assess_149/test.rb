class Employee
  include Time
  attr_accessor :name, :serial, :level

  def initialize(name, serial_number, level)
    @name = name
    @name = "Mgr #{name}" if level == "executive"
    @name = "Exe #{name}" if level == "manager"
    @serial = serial_number
    @level = level
  end

  def vacation
    puts "20 hours" if self.level == "executive"
    puts "14 hours" if self.level == "manager"
    puts "10 hours" if self.level == "regular"
    puts "0 hours" if self.level == "part-time"
  end

  def desk
    puts "In corner office" if self.level == "executive"
    puts "In private office" if self.level == "manager"
    puts "In Cube Farm" if self.level == "regular"
    puts "Unassigned" if self.level == "part-time"
  end

  def name
    puts @name
  end

  def deligate
    if self.level == "executive" or self.level == "manager"
      #deligate code
    else
      puts "sorry, you have to be higher up to deligate"
    end
  end

end







bob = Employee.new('bob', '123', "executive")
dan = Employee.new('dan', '123', "regular")
bob.vacation
bob.desk
bob.name
bob.deligate
dan.vacation
dan.desk
dan.name
dan.deligate