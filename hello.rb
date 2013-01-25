whose_turn = 0
rolls = (1..6).map { rand(6) + 1 }
asides = []
player_scores = [0,0]
  while player_scores[0] < 10000 && player_scores[1] < 10000
    puts "This set of rolls is: "
    puts rolls
    puts "Current score is : "
    score = farkle.sum(rolls) + farkle.sum(asides) 
    puts score
    if rolls.count(1) > 0 or rolls.count(5) > 0
      puts "Would you like to set aside or cash out your points?"
      puts "Enter y to set dice aside or n to end your turn"
      # get y or n
      STDOUT.flush
      check = gets.chomp
      if check == 'y' || check == 'Y'
        farkle.set_aside(rolls, asides)
        # next_turn(rolls.length)
      else
        player_scores[whose_turn] += score
        if whose_turn == 0
          whose_turn = 1
        else
          whose_turn = 0
        end
      end
    else
      puts "Farkle! Your turn is over, you've lost all points of this turn"
      if whose_turn == 0
        whose_turn = 1
      else
        whose_turn = 0
      end
      # next_turn(rolls.length)
    end
  end
    puts score
