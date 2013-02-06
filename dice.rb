class Dice

  attr_reader :dice

  # Initial roll is 6 dice because it's at the start of a turn
  def initialize
    #@dice = (1..6).map { rand(6) + 1 }
    @dice = [1,1,1,5,5,5]
  end

  # This method randomly rolls n number of dice.
  #
  # Input: n - number of dice to roll
  #
  # Output - array of n numbers ranging from 1 to 6
  def roll(n)
    @dice = (1..n).map { rand(6) + 1 }
  end

  # outputs the user's roll
  def show_dice
    puts "Your roll is: "
    puts @dice.to_s
  end


  # Checks if roll has point dice
  def has_points?
    if @dice.count(1) > 0 || @dice.count(5) > 0
      return true
    else
      return false
    end
  end

  # determines if user has hot dice.
  def hot_dice?
    if @dice.count(1) + @dice.count(5) == 6
      return true
    else
      return false
    end
  end

end
