class Player

  attr_reader :name
  attr_accessor :score

  # initializes empty variables to hold data for the player.
  def initialize(name)
    @name = name
    @score = 0
  end
end
