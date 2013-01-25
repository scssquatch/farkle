class Farkle

  def start_turn(player, n, scores, asides)
    roll = roll_dice(n)
    puts "player #{player.to_s}'s first roll is: "
    puts roll
    score = score(roll)
    puts "#{player.to_s}'s current score is: "
    puts score
    if roll.count(1) > 0 or roll.count(5) > 0
      puts "Would you like to set aside or cash out your points?"
      puts "Enter y to set dice aside or n to end your turn"
      STDOUT.flush
      check = gets.chomp
      if check == 'y' || check == 'Y'
        set_aside(roll, asides)
      else
        scores[player-1] += score
        switch_player(player)
      end
    else
      puts "Farkle! Your turn is over, you've lost all points of this turn"
      switch_player(player)
    end
  end

  def switch_player(player)
    if player == 1
      player = 2
    else
      player = 1
    end
  end

  def roll_dice(n)
    (1..n).map { rand(6) + 1 }
  end

  def set_aside(roll, asides)
    puts "Enter the number of the point die you'd like to set aside (1 or 5):"
    num = gets.to_i
    if (num == 1 || num == 5)
      asides << num
      roll.delete_at(roll.index(num))
    elsif
      puts "Please enter a number that you have."
      set_aside(roll, asides)
    end
  end

  def score(roll)
    temp = []
    score = 0
    roll.each do |die|
      die_count = roll.count(die)
      if temp.count(die) == 0
        if die_count > 5
          if die == 1
            score += 2000
          elsif die == 5
            score += 1000
          else
            score += die * 200
          end
        elsif die_count > 2
          if die == 1
            score += 1000
          elsif die == 5
            score += 500
          else 
            score += die * 100
          end
        else
          if die == 1
            score += die_count * 100
          elsif die == 5
            score += die_count * 50
          end
        end
      temp << die
      end
    end
    score
  end
end
