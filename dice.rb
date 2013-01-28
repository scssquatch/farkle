class Dice

  # Creates an empty array to store the dice
  def initialize
    @roll = []
  end

  # This method randomly rolls n number of dice.
  #
  # Input: n - number of dice to roll
  #
  # Output - array of n numbers ranging from 1 to 6
  def roll(n)
    @roll = (1..n).map { rand(6) + 1 }
  end
end
