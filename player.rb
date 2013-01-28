class Player
  attr_reader :players

  def initialize
    @players = []
  end

  def new_player(name)
    @players << name
  end

  def next_player
    @players << @players.shift
  end

end
