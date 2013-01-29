require_relative 'farkle.rb'
require_relative 'dice.rb'
require_relative 'player.rb'

class Play
  # Ask if user wants to play
  puts "Would you like to start a game? (y/n)"

  STDOUT.flush
  play = gets.chomp

  # play until user wants to stop
  while (play == 'y' || play == 'Y')

    # new farkle object to call Farkle class methods
    players = []

    puts "Enter the number of players: "
    num_players = gets.to_i
    i = 0
    while (i < num_players)
      puts "Enter the name of player #{(i+1).to_s}: "
      players << Player.new(gets.chomp)
    end

    # placeholder to output score of each turn
    current_score = 0

    # array to set aside dice each turn

    # loop until a user has won (gets over 10000 points)
    while (scores[0] < 10000 && scores[1] < 10000)
      players.each do |player|
        players[0].show_current

        roll = Dice.new
        asides = Asides.new
        score = Score.new

        roll.show_roll
        score.score(roll)
        score.show_score

        while roll.has_points?
            asides.show_asides if asides.has_asides?
            puts "Would you like to set aside, or cash out your points?"
        end
      end
    end



      # call start_turn to start the user's turn.
      # Returns the score of each turn
      current_score = farkle.start_turn(player, 6, scores, asides) 

      # Outpus the score of the turn
      puts "You scored #{current_score} points this round"

      # Add the score to the running total of the player
      scores[player-1] += current_score

      # switch players
      player = farkle.switch_player(player)
      
      # reset the asides each turn
      asides = []
    end

    # switch players because the players switch after a player has won
    player = farkle.switch_player(player)
    puts "Player #{player.to_s} wins with a score of #{scores[player-1]}!"

    # ask if user would like another game
    puts "Would you like to play a new game? (y/n)"
    play = gets.chomp
  end
  puts "Thanks for playing! I hope you enjoyed"
end
