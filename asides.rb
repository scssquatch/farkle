class Asides

  attr_reader :asides
  # Creates an empty array to store the dice
  def initialize
    @asides = []
  end

  def clear
    @asides = []
  end

  def show_asides
    puts "Your set aside dice are: "
    puts asides.to_s
  end

  def has_asides?
    if asides.length > 0
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
