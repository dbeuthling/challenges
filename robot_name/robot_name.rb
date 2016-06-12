class Robot
  LETTERS = ("A".."Z").to_a
  NUMBERS = (0..9).to_a

  @@array_of_names = []

  def initialize
    @robot_name = ""
  end

  def reset
    name = []
    2.times { name << LETTERS.sample }
    3.times { name << NUMBERS.sample }
    @robot_name = name.join("")
  end

  def name
    if @robot_name == ""
      loop do
        reset
        break unless @@array_of_names.include?(@robot_name)
      end
      p @@array_of_names << @robot_name
    end
    @robot_name
  end
end
