require_relative 'player.rb'
class Winner
  def max_score(players)
    max = 0
    players.each do |player|
      if player.score > max
        max = player.score
      end
    end
    max
  end

  def winner(players)
    temp_scores = []
    players.each do |player|
      temp_scores << player.score
    end
    return players[temp_scores.index(temp_scores.max)].name
  end
end
