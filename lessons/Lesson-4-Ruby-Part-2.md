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
  @@count = 0

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end
  def self.report
    @@count += 1
    puts "RectangleOne, reporting.  This method has been invoked #{@@count} times."
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

RectangleOne.report
RectangleOne.report

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
Ok, deep breath, let's see what are special about Ruby classes.

First, you often have an initializer.  This is a method of the class that is called when you create an instance of the class.  To create an instance of the class, you call the new method on the class itself.  Second, you typically have instance variables.  These are values stored with that instance.  Each instance has a different set of values for instance variables.  The instance variables always start with @.  That's the only way to keep values associated with the instance.  The class may have one or more instance methods, such as area in the examples above.  A method is a function associated with an instance of a class.  If you run the program above (you will get an error to be explained shortly), you note that rect2 has a different area than rect1.  They are separate instances of the same class.

Once you store the instance variables, how can you get access? Any instance method of the class has access to those variables.  Also, if you use the attr_accessor for the instance variable names, as in RectangleOne, you have access.  This is why rect1.height and rect1.width return values.  One can also set those values.

Classes can also have class methods.  These are typically declared with a "self." at the start of the name, as in self.report for RectangleOne.  You do not need an instance of the class to invoke a class method.  You just use the class name, as in:
```
RectangleOne.report
```
We will use class methods a lot in Rails, especially in Active Record access to a database.  You can also have class variables, which are only used by class methods.  Class variables start with "@@", as in the count method above.  The class itself and all instances of that class share a single copy of the class variable.

However, the RectangleTwo class does not use attr_accessor.  Instead, it defines getter and setter methods for the width attribute.  So, rect3.width returns the value of the @width instance variable for rect3.  Also, the width= setter method (note the special name, with an = at the end) allows one to set the width.  But, there is no getter or setter for height in RectangleTwo -- that is why the program returns an error.  The only way to set the height is when the instance is created.

There is a lot more to be learned about Ruby classes, but this will do for starters.  When we get to Rails, you will see class declarations like this:
```
class CustomersController < ApplicationController
...
end
```
Here, a class is being declared that inherits from the ApplicationController class.  That means that all the behavior of the CustomerController class is the same as the ApplicationController class, except for what is overridden within the CustomerController class.  This is how you customize class behavior.  It is possible to subclass the String class, for example, although this is rare.

## Ruby Modules

Sometimes, you want to implement the same behaviors in several classes.  Of course you don't want to repeat yourself.  In this case, you implement a module, and you *include* the module in each of the classes where it is needed.  You'll see this a lot in Rails. For example, both RectangleOne and RectangleTwo have a method called area, the same in each case.  One could instead create an Area module, in which case it would not be necessary to declare the area method inside each class:
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

## Ruby Require

You can split a ruby program into several files.  For example, one could put the Area module above into a file named area.rb, and put the rest of the rectangle code above into rectangle.rb, which would be the main file.  At the top of rectangle.rb, one would put a statement:
```
require './area.rb'
```
Then, when you do "ruby rectangle.rb" both files are read in and executed.  Of course, code in classes, modules, and functions are not run until those classes or modules or functions are used.

The require statement is also used to load Ruby gems, as we'll cover below.

## Ruby Standard Library and Ruby Gems

As you write Ruby programs, you have to use a variety of classes and modules.  These include basic ones like String and Hash and Array, but there are many more in the standard library.  These are documented at [https://ruby-doc.org/](https://ruby-doc.org/).  As you practice with Ruby, you should refer to that documentation.

In addition to the standard library, there are gems.  These are libraries of classes and modules that you can install and use.  These are available at [https://rubygems.org/](https://rubygems.org/).  Gems in Ruby are like npm packages in JavaScript.  We will use many.  Rails itself is a gem.  An exercise below will show you the steps in installing and using a gem.

## More Reading

Please read the following sections from [this reference:](https://github.com/gauthamchandra/learning-ruby-from-js)
- Blocks, Procs, Lambdas, and Functions  (actually, you can skip Procs and Lambdas)
- Control Statements and Looping
- OOP in Ruby (OOP is Object Oriented Programming)
- Some basic coding conventions

It is not necessary to understand all of this now.  You'll pick it up as you program.