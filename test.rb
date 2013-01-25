require_relative 'farkle.rb'
puts "Would you like to start a game? (y/n)"
STDOUT.flush
play = gets.chomp
while (play == 'y' || play == 'Y')
  player = 1
  puts "It is now player " + player + "'s turn"
  farkle = Farkle.new
  roll = farkle.start_turn(player)
  if roll.count(1) > 0 or rolls.count(5) > 0
    puts "Would you like to set aside or cash out your points?"
    puts "Enter y to set dice aside or n to end your turn"
  else
    puts "Farkle! Your turn is over, you've lost all points of this turn"
    if player == 1
      player = 2
    else
      player = 1
    end
  end
  puts "Would you like to play a new game? (y/n)"
  play = gets.chomp
end
