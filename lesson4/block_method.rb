def do_calc
    puts yield(7, 9)
end #do_calc
do_calc {|a, b| a + b}
do_calc {|a, b| a * b}