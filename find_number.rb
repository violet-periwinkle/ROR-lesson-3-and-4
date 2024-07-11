loop do
    secret_number = rand(1..100)
    puts "Guess a number between 1 and 100"
    guess = 0
    until guess == secret_number
        guess = gets.to_i
            if guess < secret_number
                puts "Too low!"
            elsif guess > secret_number
                puts "Too high!"
            elsif guess <= 0
                puts "Invalid guess"
            else guess == secret_number
                puts "Correct! You win!"
        end
    end
    puts "Play again?"
    play_again = gets.chomp
    break unless play_again.downcase == "yes"
end