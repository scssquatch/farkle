require_relative 'farkle.rb'
require_relative 'dice.rb'
require_relative 'player.rb'
require_relative 'asides.rb'
require_relative 'yesorno.rb'
require_relative 'winner.rb'
require_relative 'score.rb'

class Farkle
  winner = Winner.new
  ans = YesOrNo.new
  # Ask if user wants to play
  puts "Would you like to start a game? (y/n)"

  # play until user wants to stop
  while (ans.yes?)

    # new farkle object to call Farkle class methods
    players = []

    puts "Enter the number of players: "
    num_players = gets.to_i
    i = 0
    while (i < num_players)
      puts "Enter the name of player #{(i+1).to_s}: "
      players << Player.new(gets.chomp)
      i += 1
    end

    # placeholder to output score of each turn
    current_score = 0

    # loop until a user has won (gets over 10000 points)
    while (winner.max_score(players) < 5000)
      players.each do |player|
        puts "It is now #{player.name}'s turn"

        roll = Dice.new
        asides = Asides.new
        score = Score.new

        roll.show_dice
        score.score_dice(roll.dice)
        score.show_score
        puts "Your total score will be: #{player.score + score.score}"

        while roll.has_points?
          # asides.show_asides if asides.has_asides?
          puts "Would you like to set aside, or cash out your points?"
          puts "Enter y to set dice aside, or n to cash out"
          if ans.yes?
            asides.set_aside(roll.dice)
          else
            break
          end
          roll.roll(6-asides.asides.length)
          roll.show_dice
          asides.show_asides
          score.score_dice(roll.dice + asides.asides)
          score.show_score
          puts "Your total score will be: #{player.score + score.score}"
        end
        if roll.has_points?
          puts "You scored #{score.score.to_s} points this round!"
          puts "Press enter to continue: "
          gets.chomp
          puts "\n\n\n"
        else
          puts "Farkle! You've lost all points for this round."
          puts "Press enter to continue: "
          gets.chomp
          puts "\n\n\n"
          score.score = 0
        end
        player.score += score.score
        asides.clear
      end
    end
    puts "Congratulations, #{winner.winner(players)} has won!"
    puts "Would you like to play a new game? (y/n)"
  end
  # ask if user would like another game
  puts "Thanks for playing! I hope you enjoyed"
end
