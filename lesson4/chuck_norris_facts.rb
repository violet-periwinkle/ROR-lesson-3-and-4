require 'faker'
loop do 
    puts "Do you want to know a fact about Chuck Norris?"
    user_answer = gets.chomp
    break unless user_answer.downcase == "yes"
    puts Faker::ChuckNorris.fact
end #main loop