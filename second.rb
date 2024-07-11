puts "First name, please?"
person = {}
person[:first_name] = gets.chomp
puts "And last name?"
person[:last_name] = gets.chomp
puts "Now, age?"
person[:age] = gets.chomp
puts "Address?"
person[:address] = gets.chomp
puts "City?"
person[:city] = gets.chomp
puts "And state, thank you."
person[:state] = gets.chomp
puts person
puts person.keys
puts person.values
person[:first_name] = person[:first_name].capitalize
person[:last_name] = person[:last_name].capitalize
person[:city] = person[:city].capitalize
person[:state] = person[:state].upcase
puts person
