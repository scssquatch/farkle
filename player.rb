class Player

  attr_reader :name
  attr_accessor :score

  # Initializes an empty players array to store the players.
  # Makes a new score slot that matches with the name
  def initialize(name)
    @name = name
    @score = 0
  end
end
