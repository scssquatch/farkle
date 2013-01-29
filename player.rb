require_relative 'score.rb'
class Player

  # Initializes an empty players array to store the players.
  # Makes a new score slot that matches with the name
  def initialize(name)
    @player = [name, 0]
  end

  def name
    @player[0]
  end

  def score
    @player[1]
  end

  def show_current
    puts "It is now #{@player[0]}'s turn"
  end
end
