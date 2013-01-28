class Player
  attr_reader :players

  # Initializes an empty players array to store the players
  def initialize
    @players = []
  end

  # Creates a new player with given name
  #
  # Input: name - name of player
  def new_player(name)
    @players << name
  end

  # This method switches the player whose turn it is.
  # This switches 1 to 2 or 2 to 1.
  #
  # Input: player - whose turn it is
  #
  # Output: the opposite player (1 if 2, 2 if 1)
  def next_player
    @players << @players.shift
  end

end
