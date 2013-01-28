class Dice

  # Creates an empty array to store the dice
  def initialize
    @roll = []
    @aside = []
  end

  # This method randomly rolls n number of dice.
  #
  # Input: n - number of dice to roll
  #
  # Output - array of n numbers ranging from 1 to 6
  def roll(n)
    @roll = (1..n).map { rand(6) + 1 }
  end

  def show_roll
    puts "Your roll is: "
    puts @roll.to_s
    if has_asides?
      puts "Your set-aside dice are: "
      puts @asides.to_s
    end
  end

  def has_asides?
    if @asides.length > 0
      return true
    else
      return false
    end
  end

  # Checks if roll has point dice
  def has_points?
    if @roll.count(1) > 0 || @roll.count(5) > 0
      return true
    else
      return false
    end
  end

  # This method takes in the roll array and the asides 
  # and sets aside point dice that the user specifies
  #
  # Outputs: roll array - numbers user sets aside
  #          asides array + numbers user sets aside
  def set_aside
    # prompt user for number to set aside
    puts "Enter the number of the point die you'd like to set aside (1 or 5):"
    num = gets.to_i
    if ((num == 1 || num == 5) && roll.count(num) > 0)
      # add the number to asides, remove from the roll array
      @asides << num
      @roll.delete_at(@roll.index(num))
    elsif
      # re-prompt because user entered wrong number
      puts "Please enter a number that you have."
      set_aside(@roll)
    end
    # if user still has 1s or 5s, ask if they'd like to set more aside
    if @roll.count(1) > 0 or @roll.count(5) > 0
      puts "Would you like to set any more numbers aside?"
      check = gets.chomp
      if (check == 'y' || check == 'Y')
        set_aside(@roll)
      end
    end
  end
end
