class Farkle

  # This method covers a turn from start to finish.
  # It  takes in 4 arguments: whose turn, how many dice to roll,
  # the score array, and the asides array and then completes a turn
  # and returns the score for the entire turn at the end
  #
  # Inputs: player - whose turn it is (1 or 2)
  #         n - number of dice to roll for the turn
  #         scores - score array containing both players scores
  #         asides - array of dice set aside
  #
  # Output: score - the total score for the full turn

  def start_turn(player, n, scores, asides)
    # roll the dice to start the turn
    roll = roll_dice(n)

    # output the roll so the player can see current dice
    puts "player #{player.to_s}'s current roll is: "
    puts roll

    # if the player has set aside dice, display them
    if asides.length > 0
      puts "player #{player.to_s}'s asides are: "
      puts asides
    end

    # score the roll plus the dice set aside, then display to the user
    score = score(roll+asides)
    puts "player #{player.to_s}'s current score is: "
    puts score
    # output what the score will be if user ends turn
    puts "player #{player.to_s}'s total score will be: "
    puts scores[player-1] + score

    # if user has 1s or 5s, ask if they'd like to set them aside
    if roll.count(1) > 0 or roll.count(5) > 0
      puts "Would you like to set aside or cash out your points?"
      puts "Enter y to set dice aside or n to end your turn"
      STDOUT.flush
      check = gets.chomp
      if check == 'y' || check == 'Y'

        # set aside the dice if user says yes
        set_aside(roll, asides)
        score = start_turn(player, (6-asides.length), scores, asides)
      end
    # if no 1s or 5s, the player has farkled
    else
      puts "Farkle! Your turn is over, you've lost all points of this turn"
      score = 0
    end
    # return the score
    score
  end

  # This method switches the player whose turn it is.
  # This switches 1 to 2 or 2 to 1.
  #
  # Input: player - whose turn it is
  #
  # Output: the opposite player (1 if 2, 2 if 1)
  #
  def switch_player(player)
    if player == 1
      player = 2
    else
      player = 1
    end
    player
  end

  # This method randomly rolls n number of dice.
  #
  # Input: n - number of dice to roll
  #
  # Output - array of n numbers ranging from 1 to 6
  #
  def roll_dice(n)
    (1..n).map { rand(6) + 1 }
  end

  # This method takes in the roll array and the asides 
  # and sets aside point dice that the user specifies
  #
  # Inputs: roll array, asides array
  #
  # Outputs: roll array - numbers user sets aside
  #          asides array + numbers user sets aside
  # 
  def set_aside(roll, asides)
    # prompt user for number to set aside
    puts "Enter the number of the point die you'd like to set aside (1 or 5):"
    num = gets.to_i
    if ((num == 1 || num == 5) && roll.count(num) > 0)
      # add the number to asides, remove from the roll array
      asides << num
      roll.delete_at(roll.index(num))
    elsif
      # re-prompt because user entered wrong number
      puts "Please enter a number that you have."
      set_aside(roll, asides)
    end
    # if user still has 1s or 5s, ask if they'd like to set more aside
    if roll.count(1) > 0 or roll.count(5) > 0
      puts "Would you like to set any more numbers aside?"
      check = gets.chomp
      if (check == 'y' || check == 'Y')
        set_aside(roll, asides)
      end
    end
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
    score = 0
    # iterate through the roll array
    roll.each do |die|
      # get number of occurnces of the die
      die_count = roll.count(die)
      # if this number hasn't been counted yet
      if temp.count(die) == 0
        # This section is self-explanatory
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
            score += 1000 + (die_count-3)*100
          elsif die == 5
            score += 500 + (die_count-3)*50
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
      # add the number to temp so it isn't counted again
      temp << die
      end
    end
    # return the score of these dice
    score
  end
end
