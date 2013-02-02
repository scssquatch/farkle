require_relative 'score.rb'
require_relative 'asides.rb'
require_relative 'yesorno.rb'
require_relative 'dice.rb'

class HotDice

  # This class loops until user doesn't have hot dice anymore
  # or chooses to exit.
  #
  # Inputs: roll - The user's roll
  #         asides - The user's set_aside dice
  def hot_dice(roll, asides)
    ans = YesOrNo.new
    while roll.hot_dice?
      # if the user has hot dice
      puts "Hot dice! You may set aside all dice and roll again if you want"
      puts "If not, you may set aside a few dice, or just cash out"
      puts "Enter y to set aside all dice, or n otherwise"
      if ans.yes?
        # run hot_dice method and roll new set of dice
        asides.hot_dice(roll.dice)
        roll.roll(6)
      else
        puts "Don't want to roll again huh? Well would you like to set any aside?"
        puts "Enter y to set dice aside, or n to cash out"
        if ans.yes?
          # run normal set_aside method and roll remaining dice
          asides.set_aside(roll.dice)
          roll.roll(6-asides.asides.length)
        else
          # end hot_dice and cash out
          break
        end
      end
    end
  end
end
