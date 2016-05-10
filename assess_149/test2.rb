class PartTime
  attr_reader :name, :serial_number, :vacation_days, :work_place
  def initialize(name, serial_number)
    @name          = name
    @serial_number = serial_number
    @vacation_days = 0
    @work_place = "Unassigned"
  end
end

class FullTime < PartTime
  def initialize(name, serial_number)
    super
    @vacation_days = 10
    @work_place    = "Cube Farm"
  end
end

module Delegate
end

class Manager < FullTime
  include Delegate
  def initialize(name, serial_number)
    super
    @vacation_days = 14
    @work_place    = "Private Office"
  end

  def name
    "Mgr #{@name}"
  end
end

class Executive < Manager
  include Delegate
  def initialize(name, serial_number)
    super
    @vacation_days = 20
    @work_place = "Corner Office"
  end

  def name
    "Exe #{@name}"
  end

end

dan = Executive.new('Dan', 1234)
p dan.name
p dan.work_place
p dan.serial_number

kel = PartTime.new('KELLEY', 3432)
p kel.name
p kel.vacation_days
p kel.work_place
p kel.serial_number