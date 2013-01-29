class Score

  attr_accessor :score

  def initialize
    @score = 0
    @counted = []
    @roll = []
    @die = 0
  end

  def how_many?
    @roll.count(@die)
  end

  def been_counted?
    if @counted.count(@die) > 0
      return true
    else
      @counted << @die
      return false
    end
  end

  def is_a?(num)
    return @die == num
  end

  def score_one
    if how_many? > 5
      @score += 2000
    elsif how_many? > 2
      @score += 1000 + (how_many?-3)*100
    else
      @score += how_many?*100
    end
  end

  def score_five
    if how_many? > 5
      @score += 1000
    elsif how_many? > 2
      @score += 500 + (how_many?-3)*50
    else
      @score += how_many?*50
    end
  end

  def score_regular
    if how_many? > 5
      @score += @die*200
    elsif how_many? > 2
      @score += @die*100
    end
  end

  # This method takes in the roll (6 die array)
  # and returns the score of the dice
  #
  # Inputs: array of 6 numbers
  #
  # Outputs: score of said array
  #
  def score_dice(roll)
    @score = 0
    @roll = roll
    # iterate through the roll array
    roll.each do |num|
      @die = num
      # if this number hasn't been counted yet
      if !been_counted?
        if is_a?(1)
          score_one
        elsif is_a?(5)
          score_five
        else
          score_regular
        end
      end
    end
    # return the score of these dice
    @score
    # reset the counted numbers
    @counted = []
  end

  def show_score
    puts "Current score for this roll is: #{@score}"
  end

end
