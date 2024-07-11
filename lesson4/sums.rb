class Sum1
    attr_accessor :total
    def initialize (a, b)
        @total = a + b
    end
end#class definition Sum1
class Sum2
    def initialize (a, b)
        @a = a
        @b = b
    end #initialize
    def new_total
        @a + @b
    end #new_total
end#class definition Sum2
new_sum1 = Sum1.new(5, 6)
new_sum2 = Sum2.new(5, 6)
puts new_sum1.total
puts new_sum2.new_total