def hangman(string, array)#method that returns string
    string.each_char.with_index do |char, index|#iterate through characters
        unless array.include?(char)#check if character is in array
            string[index] = '_'#if not, change this character to _
        end#check if character is in array
    end#iterate through characters
end#method that returns string
puts hangman('string', ["s", "g"])
puts hangman('ruby', ["a", "r", "y"])
puts hangman('lullaby', ["l", "u"])