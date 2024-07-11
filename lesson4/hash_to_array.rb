user_hash = {}
5.times do
    puts "New key:"
    new_key = gets.chomp
    puts "New value:"
    new_value = gets.chomp
    user_hash[new_key] = new_value
end
puts user_hash.keys
puts user_hash.values