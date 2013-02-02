require_relative 'yesorno.rb'
class Asides

  attr_reader :asides

  # Creates an empty array to store the dice
  def initialize
    @asides = []
  end

  def clear
    @asides = []
  end

  # displays the set-aside dice to the user
  def show_asides
    puts "Your set aside dice are: "
    puts @asides.to_s
  end

  # determines if user has set-aside dice or not
  def has_asides?
    if @asides.length > 0
      return true
    else
      return false
    end
  end

  # shoves all dice in the roll into the asides
  def hot_dice(roll)
    while roll.length > 0
      asides << roll.shift
    end
  end

  # This method takes in the roll array and the asides 
  # and sets aside point dice that the user specifies
  #
  # Outputs: roll array - numbers user sets aside
  #          asides array + numbers user sets aside
  def set_aside(roll)
    ans = YesOrNo.new
    # prompt user for number to set aside
    puts "Pick a 1 or 5 from your roll. Your roll is : "
    puts roll.to_s
    begin
      puts "Enter the number of the point die you'd like to set aside (1 or 5):"
      num = gets.to_i
      if (num != 1 && num != 5 || roll.count(num) == 0)
        puts "You entered a non-point die, or a die you don't have"
      end
    end while (num != 1 && num != 5 || roll.count(num) == 0)
    # add the number to asides, remove from the roll array
    @asides << num
    roll.delete_at(roll.index(num))
    # if user still has 1s or 5s, ask if they'd like to set more aside
    if roll.count(1) > 0 or roll.count(5) > 0
      puts "Would you like to set any more numbers aside?"
      set_aside(roll) if ans.yes?
    end
    puts "\n\n"
  end
end
