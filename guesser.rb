loop do #main gameplay loop
    puts "Think of a number from 1 to 100. Ready?"
    gets
    upper_bound = 100
    lower_bound = 1
    loop do #back and forth with player
        guess = lower_bound + (upper_bound - lower_bound)/2
        puts "Is your number #{guess}?"
        response = gets.chomp
        if response.downcase == "too high" #different answers
            upper_bound = guess - 1
        elsif response.downcase == "too low"
            lower_bound = guess + 1
        elsif response.downcase == "yes"
            puts "I win!"
            break 
        else
            puts "Please answer \"yes,\" \"too high,\" or \"too low.\""
        end #different answers
        unless upper_bound >= lower_bound #check for impossible
            puts "Are you lying? Let's start over."
            break
        end #check for impossible
    end #back and forth with player
    puts "Play again?"
    play_again = gets.chomp
    break unless play_again.downcase == "yes"
end #main gameplay loop