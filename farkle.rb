require_relative 'dice.rb'
require_relative 'player.rb'
require_relative 'asides.rb'
require_relative 'yesorno.rb'
require_relative 'winner.rb'
require_relative 'score.rb'
require_relative 'hotdice.rb'

class Farkle
  attr_reader :players, :player_num, :winner, :ans
  attr_accessor :roll, :asides, :hot_asides, :hotdice, :score, :current_player

  def initialize
    @winner = Winner.new
    @ans = YesOrNo.new
    @players = []
    @roll = Dice.new
    @asides = Asides.new
    @hot_asides = Asides.new
    @hotdice = HotDice.new
    @score = Score.new
    @current_player
    @turn_finished
  end

  def get_player_num
    begin
      puts "Enter the number of players (1 or more): "
      @player_num = gets.to_i
    end while @player_num < 1
    # loop until user enters name of all players
  end

  def get_player_names
    i = 0
    while (i < @player_num)
      puts "Enter the name of player #{(i+1)}: "
      @players << Player.new(gets.chomp)
      i += 1
    end
  end

  def set_up_players
    get_player_num
    get_player_names
  end
  
  def show
    roll.show_dice
    asides.show_asides
    puts "Your dice set aside from hot dice are: #{hot_asides.asides.to_s}" if hot_asides.has_asides?
    score.score_dice(roll.dice + asides.asides + hot_asides.asides)
    score.show_score
    puts "Your total score will be: #{current_player.score + score.score}"
  end

  def scored
    # if they set aside all but one die
    if roll.dice.length == 1
      roll.show_dice
      asides.show_asides
    end&& roll.dice.length > 1
    puts "You scored #{score.score.to_s} points this round!"
  end

  def farkled
    # show dice and asides so user can see that they farkled
    asides.show_asides
    roll.show_dice
    puts "Farkle! You've lost all points for this round."
    # set total score to 0
    score.score = 0
    turn_finished = true
  end

  def hot_diced
    hotdice.hot_dice(roll, asides, hot_asides)
    score.score_dice(roll.dice + hot_asides.asides + asides.asides)
  end

  def end_turn
    # check if when turn ended they had points, to tell them
    # how much they scored
    if roll.has_points?
      scored
    # if no points then they farkled
    else
      farkled
    end
    puts "Press enter to continue: "
    gets.chomp
    puts "\n\n\n"
    # add score to player's total
    current_player.score += score.score
    # clear asides and hot_asides for next turn
    asides.clear
    hot_asides.clear
  end

  def set_aside
    # prompt user if they would like to set aside dice
    puts "in asides"
    asides.ask_user
    if ans.yes?
      asides.set_aside(roll.dice)
      # roll remaining dice (dice that aren't set aside)
      roll.roll(6-asides.asides.length)
    else
      @turn_finished = true
    end
  end

  def turn
    puts "It is now #{current_player.name}'s turn"
    roll.roll(6)
    @turn_finished = false
    # while user has not farkled and has more than 1 die
    while roll.has_points? and roll.dice.length > 1 and !@turn_finished

      # show dice, asides, score, total score
      show

      # check for hot dice
      if roll.hot_dice?
        # run hot dice program
        hot_diced
        # if user wants to cash out, end turn, if not, continue normally
        farkled unless roll.has_points?
        if asides.has_asides? || hot_asides.has_asides?
          set_aside
        else
          @turn_finished = true
        end
      else
        set_aside
      end
    end
    end_turn
  end

  def play
    # play until user wants to stop
    begin

      # placeholder to output score of each turn
      set_up_players

      # loop until a user has won (gets over 10000 points)
      while (winner.max_score(players) < 10000)
        # iterate through all the players
        players.each do |player|
          @current_player = player
          turn
        end
      end
      # output congratulations message
      puts "Congratulations, #{winner.winner(players)} has won!"
      puts "Would you like to play a new game?"
    end while (ans.yes?)
    puts "Thanks for playing! I hope you enjoyed"
  end
end
Farkle.new.play
