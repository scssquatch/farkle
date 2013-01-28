class Dice
  def initialize
    @roll = (1..6).map { rand(6) + 1 }
  end

  def roll(n)
    @roll = (1..n).map { rand(6) + 1 }
  end
end
