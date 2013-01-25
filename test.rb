require_relative 'farkle.rb'
puts "Would you like to start a game? (y/n)"
STDOUT.flush
play = gets.chomp
while (play == 'y' || play == 'Y')
  player = "player 1"
  puts "It is now " + player +"'s turn"
  farkle = Farkle.new
  roll = (1..6).map { rand(6) + 1 }
  puts player + "'s roll is: "
  puts roll
  score = farkle.score(roll)
  puts player + "'s current score is: "
  puts score

  puts "Would you like to play a new game? (y/n)"
  play = gets.chomp
end
