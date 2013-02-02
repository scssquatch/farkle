require_relative 'player.rb'
class Winner
  # finds the highest score so farkle.rb can
  # check if it is above 10,000
  def max_score(players)
    max = 0
    players.each do |player|
      if player.score > max
        max = player.score
      end
    end
    max
  end

  # finds which player has the highest score and returns it
  def winner(players)
    temp_scores = []
    players.each do |player|
      temp_scores << player.score
    end
    return players[temp_scores.index(temp_scores.max)].name
  end
end
