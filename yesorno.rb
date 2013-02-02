class YesOrNo
  # prompts user yes or no and returns true if user enters yes
  def yes?
    puts "Enter y or n : "
    ans = gets.chomp
    if ans == 'y' || ans == 'Y'
      return true
    else
      return false
    end
  end
end
