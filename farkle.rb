class Farkle
  def score(roll)
    temp = []
    score = 0
    roll.each do |die|
      die_count = roll.count(die)
      if temp.count(die) == 0
        if die_count > 5
          if die == 1
            score += 2000
          elsif die == 5
            score += 1000
          else
            score += die * 200
          end
        elsif die_count > 2
          if die == 1
            score += 1000
          elsif die == 5
            score += 500
          else 
            score += die * 100
          end
        else
          if die == 1
            score += die_count * 100
          elsif die == 5
            score += die_count * 50
          end
        end
      temp << die
      end
    end
    score
  end
end
