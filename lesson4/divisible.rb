def divisor_check #method that returns an array
    number_list = [] #create array
    for i in 0..100 #loop through numbers
        if (i % 2) == 0 #check divisors
            number_list << i 
        elsif (i % 3) == 0
            number_list << i
        elsif (i % 5) == 0
            number_list << i
        end #check divisors
    end #loop through numbers
    number_list #return array
end #method that returns an array
puts divisor_check