class Tutorial
  puts "Welcome to the farkle tutorial!"
  puts "Here you'll learn everything you need to know about farkle!"
  puts "Press enter to continue:"
  gets.chomp
  puts "\n"
  puts "The first thing you need to know in farkle is what point dice are."
  puts "5's and 1's are the only point dice. Any other die is a regular die."
  puts "While playing the game, if you roll a hand with no point dice, you have farkled, and your turn is over, receiving 0 points."
  puts "The only way to score points with non-point dice is if you have a set of 3 non-point dice."
  puts "Press enter to move on to scoring your dice."
  gets.chomp
  puts "\n"
  puts "Okay, now you need to know how to score your dice. Roll now and I'll walk you through the scoring process."
  puts "Press enter to roll your dice:"
  gets.chomp
  puts "\n"
  puts "Okay your first roll is: 1 3 5 2 5 4."
  puts "This roll is worth 200 points."
  puts "Single 5s are worth 50 points, and single 1's are worth 100"
  puts "Press enter to roll again and learn about other situations:"
  gets.chomp
  puts "\n"
  puts "Okay this roll is: 1 1 1 2 3 4."
  puts "This roll is worth 1000 points."
  puts "The reason for this is that a set of 3 1's is worth 1000 points."
  puts "Press enter to roll again and learn about other situations:"
  gets.chomp
  puts "\n"
  puts "This roll is: 5 5 5 5 3 4."
  puts "This roll is worth 550 points."
  puts "Three 5's is worth 500. Any other 5 not part of a set of three is worth 50."
  puts "Press enter to roll again and learn about other situations:"
  gets.chomp
  puts "\n"
  puts "This roll is: 2 2 2 3 4 5."
  puts "This roll is worth 250 points. A set of 3 non-point dice is worth 100 times the dice number."
  puts "Therefore you get 200 points for the set of 3 2's, and 50 for the single 5."
  puts "Press enter to roll again and learn about other situations:"
  gets.chomp
  puts "\n"
  puts "This roll is: 2 2 2 3 3 3."
  puts "This turn is worth 0."
  puts "Why, you ask? There are no point-dice, so you have farkled and your turn is over."
  puts "Press enter to try your hand at scoring a set of dice."
  gets.chomp
  puts "\n"
  puts "This roll is: 1 1 1 5 2 2."
  puts "Enter the amount of points you think this is: "
  ans = gets.to_i
  if (ans == 1050)
    puts "Correct! I think you're ready to learn about asides."
  else
    puts "Sorry, the correct answer is 1050. 1000 points for the set of 3 1's, and 50 for the lone 5."
    puts "That's enough practicing, if you still don't understand, run the tutorial again, but for now we're moving on."
  end
  puts "Press enter to move on to learning about setting dice aside."
  gets.chomp
  puts "\n"
  puts "Okay so setting dice aside is a little more complicated."
  puts "We'll start off with an example: "
  puts "Your roll is: 1 5 4 2 4 3."
  puts "You currently have 150 points. You can end the turn now, and get 150 points, or set aside one or more point dice and roll again."
  puts "For this example we will set aside some dice."
  puts "Press enter to continue:"
  gets.chomp
  puts "\n"
  puts "Okay since our roll is 1 5 4 2 4 3, there are two point dice I can set aside. Keep in mind that you must set at least one aside to roll again."
  puts "I'm going to set aside just the 1."
  puts "Now that i've set it aside, I roll the remaining 5 dice again."
  puts "Press enter to continue:"
  gets.chomp
  puts "\n"
  puts "Okay my new roll is 1 | 1 1 2 4 3."
  puts "The vertical bar is separating the new roll from the set aside dice."
  puts "This roll is worth 1000 points. The numbers you set aside are counted in the score."
  puts "Press enter to continue:"
  gets.chomp
  puts "\n"
  puts "Now we have the option to set aside more dice from the new roll."
  puts "For this example, I'm just going to cash out my dice and take the 1000 points."
  puts "Press enter to follow another example:"
  gets.chomp
  puts "\n"
  puts "Okay my roll is 4 1 4 3 2 4."
  puts "This is an interesting situation. I'm at 500 points currently, and the only number I can set aside is a 1."
  puts "If I set aside the 1, I will lose the set of 4's in hopes i get more point dice."
  puts "This is up to your discretion, and it's what the game is all about."
  puts "For now I'm just going to cash out the points, and then teach you about hot dice."
  puts "Press enter to learn about hot dice:"
  gets.chomp
  puts "\n"
  puts "Hot dice is a pretty simple concept."
  puts "If you roll a dice with ALL point dice i.e. 1 1 5 5 5 1, you get the option to roll a new set and keep your whole roll aside."
  puts "Okay so now I roll again and get 1 2 4 6 3 2. My total is now 1600. 1500 from the first roll, and 100 from the new roll."
  puts "I can set aside more dice, but I think you get the point."
  puts "Press enter to continue:"
  gets.chomp
  puts "\n"
  puts "One thing you should know is that if you set aside your hand for hot dice, then farkle, you lose all points, so sometimes it isn't worth the risk."
  puts "One last thing is there is no limit to the amount of hot dice you can get in a row."
  puts "If I roll hot dice and roll again, then get hot dice, I can roll again. This can happen until you no longer roll hot dice."
  puts "Press enter to continue:"
  gets.chomp
  puts "\n"
  puts "One last thing you need to know is that each game goes on until a player exceeds 10,000 points."
  puts "After said player reaches 10,000 points, every player after them gets to finish the turn out and try to beat them."
  puts "Okay I think you're ready to play farkle!!"
  puts "In order to play my game, run 'ruby farkle.rb' in the commandline."
  puts "Have fun!!"
end
