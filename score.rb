class Score

  def initialize
    @score = 0
  end
  # This method takes in the roll (6 die array)
  # and returns the score of the dice
  #
  # Inputs: array of 6 numbers
  #
  # Outputs: score of said array
  #
  def score(roll)
    # declare/initialize a temp array and score variable
    temp = []
    # iterate through the roll array
    roll.each do |die|
      # get number of occurnces of the die
      die_count = roll.count(die)
      # if this number hasn't been counted yet
      if temp.count(die) == 0
        # This section is self-explanatory
        if die_count > 5
          if die == 1
            @score += 2000
          elsif die == 5
            @score += 1000
          else
            @score += die * 200
          end
        elsif die_count > 2
          if die == 1
            @score += 1000 + (die_count-3)*100
          elsif die == 5
            @score += 500 + (die_count-3)*50
          else 
            @score += die * 100
          end
        else
          if die == 1
            @score += die_count * 100
          elsif die == 5
            @score += die_count * 50
          end
        end
      # add the number to temp so it isn't counted again
      temp << die
      end
    end
    # return the score of these dice
    @score
  end

  def show_score
    puts "Current score for this roll is: #{@score}"
  end
end
