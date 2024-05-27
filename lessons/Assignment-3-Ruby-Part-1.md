## Next Program

Create `second.rb`.  It should do the following:
- Prompt for and collect your first name, stored using the key `:first_name` in a person hash.
- Prompt for and collect your last name, and store that in the hash.
- Prompt for and collect your age, storing that in the hash.
- Prompt for and collect your street address, and store that in the hash.
- Prompt for and collect your city, and store that in the hash.
- Prompt for and collect your state, and store that in the hash.
- Put the value of the hash to the console, using puts.
- Put the keys for the hash to the console, also using puts. Hint: The Hash class has a method you can call.  Note that you get an array back.
- Put the values for the hash to the console, also using puts.
- Change the first name, last name, and city as stored in the hash, so that each of these is capitalized.  Hint: You can use the capitalize method of the string class.  So you would have:

    ```ruby
    person[:first_name] = person[:first_name].capitalize
    ```

- Change the state as stored in the person hash to upper case.
- Put the hash to the console again.

Methods follow the same naming convention as variables, except that a method might end with a `?`, which means it returns true or false (a "boolean"); or a method might end with a `!`, which means that it changes the passed in value (often an array or hash), as well as returning the changed value; or a method might also end with a `=` which means that it's a setter.  We'll get to setters when we get to classes.

## Flow of Control

Here is some JavaScript:

```javascript
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

```ruby
x = 17
if x > 18
  puts "x is more than 18"
elsif x > 11
  puts "x is more than 11"
else
  puts "x is less than or equal to 11"
end
```

As you can see, there are some syntactic differences.  For example, there is the new word "elsif", and curly braces are used less often, except in hashes.

Ruby has an additional keyword, `unless`, which is effectively `if not`, and it can be paired with `else` in the same way that if does.

```ruby
x = 0

unless x.positive?
  warn "x is not a positive number"
end
```

In Ruby, the `if`/`unless` can also come after an expression at the end of a line, but with this syntax you can't use `elsif` or `else` with it. For example:

```ruby
x = 0
warn "x is not a positive number" unless x.positive?
```

## Loops in Ruby

There are various ways to do loops in Ruby:

```ruby
5.times do
  puts "Hi There"
end

# If you need to track which iteration of the `times` loop you're in, then you can use a "block argument."
# You'll learn more about Ruby's "blocks" later.
5.times do |x|
  puts x # The value is "0-indexed", so this will print numbers 0 to 4 instead of 1 to 5
end

(1..5).each do |x|
  puts x
end

for i in 1..5
  puts i
end

x = 0
while x < 5
  x += 1 # Not x++ because neither `++` nor `--` work in Ruby
  puts x
end

x = 5
until x < 1 # `until` is effectively `while not`
  puts x
  x -= 1
end

x = 0
puts x while (x += 1) <= 5 # `while`/`until` can also be placed after an expression

# You can skip an iteration with the `next` keyword or exit the loop with `break`:

x = 0
while x < 5
  x += 1
  next if x == 3 # Avoid printing the number 3
  puts x
end

x = 5
loop do # Same as `while true`
  puts x
  x -= 1
  break if x < 1
end
```

So ... the usual stuff, mostly similar to JavaScript, with some differences.

## Program 3

Create `find_number.rb`.  You use the built-in Ruby random number generator.  The following returns a value from 1 to 100 inclusive:

```ruby
secret_number = rand(1..100)
```

The program should do the following:

1. It generates a random number from 1 to 100.
2. In a loop, it prompts you for a guess. What you enter will be a string.  So you convert it to an integer with the `to_i` method of the string class.
3. It tells you whether your guess is too high, too low, or correct.
4. If your guess is correct, it exits the loop, and asks you if you want to play again. If so, it starts with a new random number.  If not, it exits the program.
5. Be sure you handle the case where the guess is not a number.  The `to_i` method would return 0 in this case, so the program should say that the guess is invalid.

## Program 4

Create `guesser.rb`.  When this program starts, it asks you to think of a number from 1 to 100.  It then makes guesses.  You tell it whether the guess is too low, too high, or correct, until it guesses your number.  The program will need to keep track of the lowest and highest possible remaining values, and it should guess something between them.  The program should prompt you again if you say something besides "too low", "too high" or "correct".  The program should also handle the case where you are lying, and should call you out.  You are lying if the program correctly guesses the number, but you don't say so.  You are lying if you tell the program that its guess is too low, when it's really too high, or vice versa.  Of course, the program won't be able to tell right away that you are lying, as it will have to exhaust the possible answers.  Make the program efficient -- basically a binary search.  Once it guesses correctly, or figures out you are lying, it should prompt you to play again, exiting if you decline.

## Submitting Your Work

As usual, you should add, commit, and push your work.  Then create a pull request for the `lesson3` branch on GitHub, and include a link to the pull request in your homework submission.
