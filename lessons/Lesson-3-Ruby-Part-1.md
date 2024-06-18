The next three lessons are an introduction to the Ruby language for JavaScript developers.  Ruby is an easy language to learn.  Many tutorials spend a lot of time explaining what a variable is, and what basic flow of control with if and else is, and loops, and so on.  But, you know JavaScript.  So you already know all that stuff.  This series of three lessons will bring you up to speed on Ruby.

Ruby does have a syntax that is different from JavaScript, so you'll have to get to know the differences.  There are two important differences in the structure of the language.  First, Ruby is a genuinely object oriented language, which JavaScript is not.  Second, Ruby is a multithreaded language, unlike JavaScript.  We won't use the threading explicitly, but it comes in very handy in Rails, because one can do time consuming operations without those annoying JavaScript callbacks or promises or anything like that.

You should fork [this repository](https://github.com/Code-the-Dream-School/ROR-lesson-3-and-4.git), and then clone the fork.  Change directories into the folder that is created when you clone.  Create the lesson3 branch, and start your work in that branch.

## Ruby Basics

Here are three references.  First, [here's a brief summary](https://github.com/gauthamchandra/learning-ruby-from-js/blob/master/README.md) of what you must learn.  You may also want to refer to [this cheatsheet.](https://github.com/ThibaultJanBeyer/cheatsheets/blob/master/Ruby-Cheatsheet.md)  Finally, if you want to spend more time with a complete tutorial, you could do [the Odin course.](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby)  You don't need to read all of these now.

You should already have installed Ruby as part of your machine setup.  Windows users should always use the Windows Linux Subsystem for Ruby development.  You can do Ruby in Windows native, but once we get to Rails, Windows native is a very poor environment.  Check right now by entering this command in your terminal:

```shell
ruby -v
```

You should have a Ruby version that is at least 3.2.  If not, STOP and go through the machine setup again.

## Ruby Variables

You start using a ruby variable by assigning a value, like so:

```ruby
first_variable = 7
```

That's it.  There is no `const` or `let` or `var`.  Variables should be named in snake case, which means that if you have several words in your variable name, you separate them with an underscore.  It's good, of course, to use descriptive variable names.  A couple of other new things:

- `puts` and `print` output strings to the console.  There is no `console.log`.  The `puts` method puts a string with a line end, and the `print` method puts a string without the line end.
- `gets` gets a line of input from the console and returns a string.  Of course, this is rarely done in JavaScript.
- `gets.chomp` gets a line of input from the console and returns a string, having removed the line end.
- Comments start with a `#` in Ruby.
- For string interpolation, you used the backtick in JavaScript, and then `${}`.  For string interpolation in Ruby, you use the double quotes, and then `#{}`.

Ok, time for your first program.  Create `first.rb` in this repository, as follows:

```ruby
puts "Enter your name." # Here we put a prompt to the console
name = gets.chomp       # Here we collect the answer
puts "Well hello, #{name}!"  # We respond with a greeting
value_a = value_b
```

Now run it in your terminal:

```shell
ruby first.rb
```

You'll get an error (after putting in your name) because the last line references an undefined variable. Note that Ruby tells you where the error is.  So remove that last line and run the program again.

The `puts` call is a call to a method.  Ruby does not require parentheses for method calls, provided that the argument is the last thing on the line.  You can put the parentheses in, and sometimes it is wise to do so for clarity.  The gets `call` is also a call to a method, and that call is chained to another method call, `chomp`.  So you could write this as

```ruby
gets().chomp()
```

if you wanted to be a little verbose, but this goes against Ruby convention.

Also, comments start with the `#` sign.  Everything in the line after that is a comment.

Ok, so much for preliminaries.  Now read [this.](https://github.com/gauthamchandra/learning-ruby-from-js/blob/master/README.md) Read it carefully.  You might not catch on to everything at first reading.

## Ruby Symbols and Hashes

One of the things that happens a lot in Ruby is that you create a *hash*.  A hash is a collection of ordered pairs, where each pair is a key and a value.  JavaScript uses the word "object" for hashes, but in Ruby, a hash is only one class of object, and there are many other object classes.  In Ruby, the keys for hashes are often symbols.  A symbol starts with a colon followed by some descriptive string.  So you might have the following symbols:

```ruby
:name
:year
:phone
:age
```

and from them, you could generate the following hash:

```ruby
washington_hash = { name: "George Washington",
  year: 1776,
  phone: "not yet invented",
  age: 46
}
```

In this notation, the keys are the same symbols as above, but when declaring a hash, you put the colon after the symbol name.  You can declare a new empty hash as follows:

```ruby
new_hash = {}
```

And you can add to an existing hash as follows:

```ruby
washington_hash[:rank] = "general"
```

The keys for hashes are not always symbols -- they can be any object type.  Also the values can be any object type.

Everything in Ruby is an object.  In this case, we are using an object that belongs to the Hash class.  Next, we'll use a tool called interactive ruby (irb) to explore these ideas.  Type the following:

```ruby
irb
example_string = "this is a string."
example_string.class
:name.class
this_hash = {}
this_hash.class
this_hash.methods
quit
```

As you saw, there are many methods associated with the Hash class. You could, for example, do `this_hash.length`.  Now, you won't be able to remember all the methods of a given class.  So you need to get in habit of looking them up.  The reference is [here.](https://ruby-doc.org/).  Go to the API docs for Ruby 3.2.2, and then search on Hash.  You'll find methods that may be useful.

## Percent Notation

In various Ruby and Rails programs, you will see percent notation.  This is an easy way to create arrays and quoted strings.  You can create an array of words or symbols.  Also, you can create a string with both single quotes and double quotes inside it.  In either case, there are other ways to create these values, but percent notation saves typing.  Use IRB again to experiment (you don't have to enter the comments):

```ruby
irb
puts %w[aaa bbb ccc ddd].inspect # an array of strings
puts %i[aaa bbb ccc ddd].inspect # an array of symbols
puts %q["What's that again?"] # A string that has both single and double quotes in it

# Compare that with this string, that has a single quote in it but does not contain double quotes
puts "What's that again?"
quit
```

A full list of percent literals can be found [here.](https://docs.ruby-lang.org/en/3.2/syntax/literals_rdoc.html#label-Percent+Literals)
