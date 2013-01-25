require_relative 'farkle.rb'
puts "Would you like to start a game? (y/n)"
STDOUT.flush
play = gets.chomp
while (play == 'y' || play == 'Y')
  player = 1
  scores =[0,0]
  asides = []
  puts "It is now player #{player.to_s}'s turn"
  farkle = Farkle.new
  while scores[0] < 10000 && scores[1] < 10000
    roll = farkle.start_turn(player, 6)
    puts "Would you like to play a new game? (y/n)"
    play = gets.chomp
  end
end
