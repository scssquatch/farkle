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
end
