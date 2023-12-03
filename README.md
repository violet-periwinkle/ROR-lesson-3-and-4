# Ruby for JavaScript Developers

Ruby is an easy language to learn.  Many tutorials spend a lot of time explaining what a variable is, and what basic flow of control with if and else is, and loops, and so on.  But, you know JavaScript.  So you already know all that stuff.  This series of three lessons will bring you up to speed on Ruby.

Ruby does have a syntax that is different from JavaScript, so you'll have to get to know the differences.  There are two important differences in the structure of the language.  First, Ruby is a genuinely object oriented language, which JavaScript is not.  Second, Ruby is a multithreaded language, unlike JavaScript.  We won't use the threading explicitly, but it comes in very handy in Rails, because one can do time consuming operations without those annoying JavaScript callbacks or promises or anything like that.

You should fork this repository, and then clone the fork.  You should then create the lesson3 branch,
and start your work in that branch.

# Lesson 3: Ruby Basics

Here are three references.  First, [here's a brief summary](https://github.com/gauthamchandra/learning-ruby-from-js/blob/master/README.md) of what you must learn.  You may also want to refer to [this cheatsheet.](https://github.com/gauthamchandra/learning-ruby-from-js/blob/master/README.md)  Finally, if you want to spend more time with a complete tutorial, you could do [the Odin course.](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby)  You don't need to read all of these now.

You should already have installed Ruby as part of your machine setup.  Windows users should always use the Windows Linux Subsystem for Ruby development.  You can do Ruby in Windows native, but once we get to Rails, Windows native is a very poor environment.  Check right now by entering this command in your terminal:
```
ruby -v
```
You should have a ruby version that is at least 3.2.  If not, STOP and go through the machine setup again.

## Ruby Variables

You start using a ruby variable by assigning a value, like so:
```
first_variable = 7
```
That's it.  There is no "const" or "let" or "var".  Variables should be named in snake case, which means that if you have several words in your variable name, you separate them with an underscore.  It's good, of course, to use descriptive variable names.  A couple of other new things:

- puts and print output strings to the console.  There is no console.log.  The puts function puts a string with a line end, and the print function puts a string without the line end.
- gets gets a line of input from the console and returns a string.  Of course, this is rarely done in JavaScript.
- gets.chomp gets a line of input from the console and returns a string, having removed the line end.
- Comments start with a # in Ruby.
- For string interpolation, you used the back-tic in JavaScript, and then ```${}```.  For string interpolation in Ruby, you use the double quotes, and then ```#{}```.

Ok, time for your first program.  Create first.rb in this repository, as follows:
```
puts "Enter your name." # Here we put a prompt to the console
name = gets.chomp       # Here we collect the answer
puts "Well hello, #{name}!"  # We respond with a greeting
value_a = value_b
```
Now run it in your terminal:
```
ruby first.rb
```  
You'll get an error (after putting in your name) because the last line references an uninitialized variable. Note that Ruby tells you where the error is.  So remove that last line and run the program again.  

Ok, so much for preliminaries.  Now read [this.](https://github.com/gauthamchandra/learning-ruby-from-js/blob/master/primitives_and_other_basics.md) Read it carefully.  You might not catch on to everything at first reading.

## Ruby Symbols and Hashes

One of the things that happens a lot in Ruby is that you create a *hash*.  A hash is a collection of ordered pairs, where each pair is a key and a value.  JavaScript calls hashes objects, but in Ruby, a hash is only one class of object, and there are many other object classes.  In Ruby, the keys for hashes are often symbols.  A symbol starts with a colon followed by some descriptive string.  So you might have the following symbols:
```
:name
:year
:phone
:age
```
and from them, you could generate the following hash:
```
washington_hash = { name: "George Washington",
  year: 1776,
  phone: "not yet invented",
  age: 46
}
```
In this notation, the keys are the same symbols as above, but when declaring a hash, you put the colon after the symbol name.  You can declare a new empty hash as follows:
```
new_hash = {}
```
And you can add to an existing hash as follows:
```
washington_hash[:rank] = "general"
```
The keys for hashes are not always symbols -- they can be any object type.  Also the values can be any object type.  

Everything in Ruby is an object.  In this case, we are using an object that belongs to the Hash class.  Next, we'll use a tool called interactive ruby to explore these ideas.  Type the following:
```
irb
example_string = "this is a string."
example_string.class
:name.class
this_hash = {}
this_hash.class
this_hash.methods
quit
```
As you saw, there are many methods associated with the Hash class. You could, for example, do ```this_hash.length```.  Now, you won't be able to remember all the methods of a given class.  So you need to get in habit of looking them up.  The reference is [here.](https://ruby-doc.org/).  Go to the API docs for Ruby 3.2.2, and then search on Hash.  You'll find methods that may be useful.

## Next Program

Create second.rb.  It should do the following:
- Prompt for and collect your first name, stored using the key :first_name in a person hash.
- Prompt for and collect your last name, and store that in the hash.
- Prompt for and collect your age, storing that in the hash.
- Prompt for and collect your street address, and store that in the hash.
- Prompt for and collect your city, and store that in the hash.
- Prompt for and collect your state, and store that in the hash.
- Put the value of the hash to the console, using puts.
- Put the keys for the hash to the console, also using puts. Hint: The Hash class has a method you can call.  Note that you get an array back.
- Put the values for the hash to the console, also using puts.
- Change the first name, last name, and city as stored in the hash, so that each of these is capitalized.  Hint: You can use the capitalize method of the string class.  So you would have:
    ```
    person[:first_name] = person[:first_name].capitalize
    ```
- Change the state as stored in the person hash to upper case.
- Put the hash to the console again.

Functions follow the same naming convention as variables, except that a function might end with a "?", which means it returns true or false; or a function might end with a "!", which means that it changes the value, as well as returning the new value; or a function might end with a "=" which means that it's a setter.  We'll get to setters when we get to classes. 

## Flow of Control

Here is some JavaScript:
```
const x = 17
if (x > 18) {
    console.log("x is more than 18")
} else if (x > 11) {
    console.log("x is more than 11")
} else {
    console.log("x is less than or equal to 11")
}
```
and here is Ruby:
```
x = 17
if x > 18
  puts "x is more than 18"
elsif x > 11
  puts "x is more than 11" 
else
  puts "x is less than or equal to 11"
end
```
So there are some syntactic differences.  In Ruby, one can often omit the parentheses, and there is the new word "elsif", and curly braces are used less often, except in hashes.

## Loops in Ruby

There are various ways to do loops in Ruby:
```
3.times do
  puts "Hi There"
end

x = 0
loop do
  puts x
  if x>7
    break
  end
  x += 1
end

for i in 1..5
  puts i
end

x = 9

while x > 0 do
  puts x
  x -= 1 # Not x--.  That doesn't work in Ruby
end

x = 0

until x > 9 do
  x += 1
  if x == 5  # You could also have: if x == 5 then next 
    next
  end
  puts x
end  
```
So ... the usual stuff, mostly similar to JavaScript, with some differences.
## Program 3

Create find_number.rb.  You use the built in Ruby random number generator.  The following returns a value from 1 to 100 inclusive:
```
secret_number = rand(1..100)
```
The program should do the following:

1. It generates a random number from 1 to 100.
2. In a loop, it prompts you for a guess. What you enter will be a string.  So you convert it to an integer with the to_i method of the string class. 
3. It tells you whether your guess is too high, too low, or correct.
4. If your guess is correct, it exits the loop, and asks you if you want to play again. If so, it starts with a new random number.  If not, it exits the program.
5. Be sure you handle the case where the guess is not a number.  The to_i method would return 0 i this case, so the program should say that the guess is invalid.

## Program 4

Create guesser.rb.  When this program starts, it asks you to think of a number from 1 to 100.  It then makes guesses.  You tell it whether the guess is too low, too high, or correct, until it guesses your number.  The program will need to keep track of the lowest and highest possible remaining values, and it should guess something between them.  The program should prompt you again if you say something besides "too low", "too high" or "correct".  The program should also handle the case where you are lying, and should call you out.  You are lying if the program correctly guesses the number, but you don't say so.  You are lying if you tell the program that its guess is too low, when it's really too high, or vice versa.  Of course, the program won't be able to tell right away that you are lying.  Make the program efficient -- basically a binary search.  Once it guesses correctly, or figures out you are lying, it should prompt you to play again, exiting if you decline.

## Submitting Your Work

As usual, you should add, commit, and push your work.  Then create a pull request for the lesson3 branch on github, and include a link to the pull request in your homework submission.

# Lesson 4: Ruby Blocks, Functions, and Classes

For this lesson, create a lesson4 branch.  This should be done when the lesson3 branch is active.

## Ruby Blocks

Many Ruby methods are passed a block.  This works a little like a callback in JavaScript.  Here is an example.
```
// First, in JavaScript
const stringArray = ["first", "second", "third"]

stringArray.forEach((str) => {
  console.log(str)
})
```

```
# Next, in Ruby, with a block

string_array = ["first", "second", "third"]

string_array.each do | str | # you could also have { | str| puts str }
  puts str
end
```
The appearance is a little different.  You surround the value that is to be passed on each iteration with vertical bars.  Some blocks are passed multiple values, as in the following:
```
this_hash = {first: 1, second: "two", third: :three }

this_hash.each_pair do | key, value |
  puts "the key is #{key}"
  puts "the value is #{value}"
end

```
You never use "return" in a block.  Sometimes a method may take a parameter as well as a block, as in the following:

```
my_array = [3, 4, 5]
puts( my_array.reduce(7) do |total, element|
  total += element
end)

# Note the use of parentheses above.  Ruby does not always need them, but if you are passing
# the results of one method to another, they can be important, as Ruby will get confused.

# In this case, 7 is an initial value for the reduce operation.

# While we're at it, we'll also give an example of the map method.  These methods 
# and various others can be used on Ruby arrays, because the Array class includes the Enumerable module.
# The map and reduce methods are frequently useful.

puts my_array.map do | element |
  element * 2
end
```
## Ruby Functions

Ruby functions are declared with the keyword def.  As follows:

```
def multiply(x, y)
  x * y
end

multiply 6, 7

```
In Ruby, you do not have to use "return".  The returned value is the value of the last expression in the function.  Sometimes you do need to use return, if you want to return from the function early.  As always, none of the code in the function is executed until it is called.  Also, variables declared inside the function are not accessible from code outside the function.

## Ruby Classes

As we've noted, everything in Ruby is an object, which is to say, it is an instance of a class.  So, for example, in the following:
```
first_string = "aardvark"
second_string = "beetle
```
we have two instances of the String class.  Each instance stores different data..

Let's create a couple of classes.
```
class RectangleOne  # Note: CamelCase, starting with a capital, is used for classes.
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end
end

class RectangleTwo
  
  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end

  def width
    @width
  end

  def width= width
    @width = width
  end
end

rect1 = RectangleOne.new(5,4)
rect2 = RectangleOne.new(6,3)
  
puts rect1.height
puts rect1.area
puts rect2.area
  
rect3 = RectangleTwo.new(7, 2)
puts rect3.area
puts rect3.width
rect3.width=4
puts rect3.width
puts rect3.height # throws an error

```
Ok, deep breath, let's see what are special about Ruby classes.  First, you often have an initializer.  This is a method of the class that is called when you create an instance of the class.  To create an instance of the class, you call the new method on the class itself.  Second, you typically have instance variables.  These are values stored with that instance.  Each instance has a different set of values for instance variables.  The instance variables always start with @.  That's the only way to keep values associated with the instance.  The class may have one or more instance methods, such as area in the examples above.  A method is a function associated with an instance of a class.  If you run the program above (you will get an error to be explained shortly), you note that rect2 has a different area than rect1.  They are separate instances of the same class.

Once you store the instance variables, how can you get access? Any instance method of the class has access to those variables.  Also, if you use the attr_accessor for the instance variable names, as in RectangleOne, you have access.  This is why rect1.height and rect1.width return values.  One can also set those values.

However, the RectangleTwo class does not use attr_accessor.  Instead, it defines getter and setter methods for the width attribute.  So, rect3.width returns the value of the @width instance variable for rect3.  Also, the width= setter method (note the special name, with an = at the end) allows one to set the width.  But, there is no getter or setter for height in RectangleTwo -- that is why the program returns an error.  The only way to set the height is when the instance is created.

There is a lot more to be learned about Ruby classes, but this will do for starters.  When we get to Rails, you will see class declarations like this:
```
class CustomersController < ApplicationController
...
end
```
Here, a class is being declared that inherits from the ApplicationController class.  That means that all the behavior of the CustomerController class is the same as the ApplicationController class, except for what is overridden within the CustomerController class.  This is how you customize class behavior.  It is possible to subclass the String class, for example, although this is rare.

## Ruby Modules

Sometimes, you want to implement the same behaviors in several classes.  Of course you don't want to repeat yourself.  In this case, you implement a module, and you require or include the module in each of the classes where it is needed.  You'll see this a lot in Rails. For example, both RectangleOne and RectangleTwo have a method called area, the same in each case.  One could instead create an Area module, in which case it would not be necessary to declare the area method inside each class:
```
module Area
  def area
    @height * @width
  end
end

class RectangleOne
  include Area
  ...
end

class RectangleTwo
  include Area
  ...
end
```
## More Reading

Please read the following sections from [this reference:](https://github.com/gauthamchandra/learning-ruby-from-js)
- Blocks, Procs, Lambdas, and Functions  (actually, you can skip Procs and Lambdas)
- Control Statements and Looping
- OOP in Ruby (OOP is Object Oriented Programming)
- Some basic coding conventions

It is not necessary to understand all of this now.  You'll pick it up as you program.

## Programming Assignment for Lesson 4

You should be working in the lesson4 branch.

(1) Write a method that returns in an array all the numbers between 1 and 100 that are divisible by 2 or 3 or 5. Then call the method in your program and print out what it returns.  Call the program divisible.rb.

(2) Write a program hangman.rb that contains a function called hangman.  The function's parameters are a word and an array of letters.  It returns a string showing the letters that have been guessed.  Call the function from within your program so that you know that it works.

Example: hangman("bob",["b"]) should evaluate to "b_b"
Example: hangman("alphabet",["a","h"]) should return "a__ha___"

(3) Write a program that collects 5 keys and 5 values from the user, and stores them in a hash.  Write a function that accepts the hash as a parameter and prints out an array of keys and an array of values.  Call the function within your program so you know it works. (Question: Can you find online information on Ruby hash methods that will help with this function?)  Call this program hash_to_array.rb.

(4) Create a program sums.rb with two classes.

(a) a class called Sum1 with an initialize method that takes two parameters and sets the instance variable @total to the sum of the two.  Include a line at the top of the class:

attr_accessor :total

(b) a class called Sum2 with an initialize method that takes two parameters a and b and sets the instance variable @a to the parameter a and the instance variable @b to the parameter b. Create a method new_total inside Sum2 that returns the sum of the instance variables @a and @b.

(c) In the mainline program, create instances of Sum1 and Sum2, passing 5 and 6 as parameters on the new statement.  Print out the total for Sum1.  Print out the new_total for Sum2.

(5) The ruby array sort method can use a block to sort various arrays.  The block
must compare between two elements of the array, a and b.  If a<b, it should evaluate to
-1.  If a==b, it should evaluate to 0.  And if a>b, it should evaluate to 1. Here is the
start of a program, which you should call sort_blocks.rb.

```ruby
class Book
  attr_reader :author, :title, :count
  def initialize(author,title,count)
    @author = author
    @title = title
    @count = count
  end
  def to_s
    "author: #{author} title: #{title} count: #{count}"
  end
end

book_array = []
book_array.push(Book.new("Beatrice Potter","Peter Rabbit",25))
book_array.push(Book.new("Henry Fielding","Tom Jones",12))
book_array.push(Book.new("Bob Woodward","All the President's Men",30))

puts "Sorting alphabetically by author"

new_array = book_array.sort do |a,b|
  author1 = a.author.downcase
  author2 = b.author.downcase
  author1 <=> author2
  # if author1 > author2
  #   1
  # elsif author1 < author2
  #   -1
  # else
  #   0
  # end
end
puts new_array
```

Note the use of the spaceship operator <=>.  It does what the commented out
lines do, but on one line.

Add to this program. Add additional calls to book_array.sort that pass blocks.  For your first
call to sort, pass a block so that the array is sorted in order of title,
and print out the array.  For your second call to sort, pass a block so that
the array is sorted in order of copies, and print out the array.

(6) Create a program block_function.rb.  It should have a function do_calc that calls a
block using a yield statement.  The yield statement will pass the numbers 7 and
9 to a block, and then do_calc will print out the result returned by the yield.  Call the do_calc function twice in your program. The first time, pass a block that adds the two numbers. The second time,
pass a block that multiplies the two numbers.  Your program should print out 16 and 63.   

## Submitting Your Work

As usual, you add, commit, and push your changes.  In this case you are pushing the lesson4 branch.  Then you create a pull request for the lesson4 branch, and submit a link to the pull request with your homework.
