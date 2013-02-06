require_relative 'farkle.rb'
require_relative 'dice.rb'
require_relative 'player.rb'
require_relative 'asides.rb'
require_relative 'yesorno.rb'
require_relative 'winner.rb'
require_relative 'score.rb'
require_relative 'hotdice.rb'

class Farkle
  winner = Winner.new
  ans = YesOrNo.new

  # Ask if user wants to play
  puts "Would you like to start a game? (y/n)"

  # play until user wants to stop
  while (ans.yes?)

    # new farkle object to call Farkle class methods
    players = []

    begin
      puts "Enter the number of players (1 or more): "
      num_players = gets.to_i
    end while num_players < 1
    i = 0
    # loop until user enters name of all players
    while (i < num_players)
      puts "Enter the name of player #{(i+1).to_s}: "
      players << Player.new(gets.chomp)
      i += 1
    end

    # placeholder to output score of each turn
    current_score = 0

    # loop until a user has won (gets over 10000 points)
    while (winner.max_score(players) < 5000)
      # iterate through all the players
      players.each do |player|
        puts "It is now #{player.name}'s turn"

        # add class objects
        roll = Dice.new
        asides = Asides.new
        hot_asides = Asides.new
        hotdice = HotDice.new
        score = Score.new

        # while user has not farkled and has more than 1 die
        while roll.has_points? and roll.dice.length > 1

          # show dice, asides, score, total score
          roll.show_dice
          asides.show_asides
          puts "Your dice set aside from hot dice are: #{hot_asides.asides.to_s}" if hot_asides.has_asides?
          score.score_dice(roll.dice + asides.asides + hot_asides.asides)
          score.show_score
          puts "Your total score will be: #{player.score + score.score}"

          # check for hot dice
          if roll.hot_dice?
            # run hot dice program
            hotdice.hot_dice(roll, asides, hot_asides)
            score.score_dice(roll.dice + hot_asides.asides + asides.asides)

            # if user wants to cash out, end turn, if not, continue normally
            break unless asides.has_asides? || !roll.has_points? || hot_asides.has_asides?
          end

          # prompt user if they would like to set aside dice
          asides.ask_user
          if ans.yes?
            asides.set_aside(roll.dice)
          else
            # end turn
            break
          end
          # roll remaining dice (dice that aren't set aside)
          roll.roll(6-asides.asides.length)
        end
        # check if when turn ended they had points, to tell them
        # how much they scored
        if roll.has_points?
          # if they set aside all but one die
          if roll.dice.length == 1
            roll.show_dice
            asides.show_asides
          end&& roll.dice.length > 1
          puts "You scored #{score.score.to_s} points this round!"
          puts "Press enter to continue: "
          gets.chomp
          puts "\n\n\n"
        # if no points then they farkled
        else
          # show dice and asides so user can see that they farkled
          asides.show_asides
          roll.show_dice
          puts "Farkle! You've lost all points for this round."
          puts "Press enter to continue: "
          gets.chomp
          puts "\n\n\n"
          # set total score to 0
          score.score = 0
        end
        # add score to player's total
        player.score += score.score
        asides.clear
      end
    end
    # output congratulations message
    puts "Congratulations, #{winner.winner(players)} has won!"
    puts "Would you like to play a new game?"
  end
  puts "Thanks for playing! I hope you enjoyed"
end
