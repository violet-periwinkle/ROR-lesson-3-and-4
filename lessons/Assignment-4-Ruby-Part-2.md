For this assignment, create a `lesson4` branch.  This should be done when the `lesson3` branch is active.

1. Write a method that returns in an array all the numbers between 1 and 100 that are divisible by 2 or 3 or 5. Then call the method in your program and print out what it returns.  Call the program `divisible.rb`.

2.  Write a program `hangman.rb` that contains a method called `hangman`.  The method's parameters are a word and an array of letters.  It returns a string showing the letters that have been guessed.  Call the method several times from within your program, testing with different words and strings, and printing out what is returned, so that you know that your hangman method works.

    Example: `hangman("bob", ["b"])` should return `"b_b"`
    Example: `hangman("alphabet", ["a", "h"])` should return `"a__ha___"`

3. Write a program that collects 5 keys and 5 values from the user, and stores them in a hash.  Write a method that accepts the hash as a parameter and prints out an array of keys and an array of values.  Call the method within your program so you know it works. (Question: Can you find online information on Ruby hash methods that will help with this method?)  Call this program `hash_to_array.rb`.

4. Create a program `sums.rb` with two classes.

    (a) a class called `Sum1` with an initialize method that takes two parameters and sets the instance variable `@total` to the sum of the two.  Include a line at the top of the class:

    ```ruby
    attr_accessor :total
    ```

    (b) a class called `Sum2` with an initialize method that takes two parameters `a` and `b`, and sets the instance variable `@a` to the parameter `a` and the instance variable `@b` to the parameter `b`. Create a method `new_total` inside `Sum2` that returns the sum of the instance variables `@a` and `@b`.

    (c) In the mainline program, create instances of `Sum1` and `Sum2`, passing `5` and `6` as parameters on the new statement.  Print out the `total` for `Sum1`.  Print out the `new_total` for `Sum2`.

5. The Ruby array sort method can take a block to sort an array in various ways.  The block
must compare between two elements of the array, `a` and `b`.  If a < b, it should evaluate to
`-1`.  If a == b, it should evaluate to `0`.  And if a > b, it should evaluate to `1`. Here is the
start of a program, which you should call `sort_blocks.rb`.

    ```ruby
    class Book
      attr_reader :author, :title, :count

      def initialize(author, title, count)
        @author = author
        @title = title
        @count = count
      end

      def to_s
        "author: #{author} title: #{title} count: #{count}"
      end
    end

    book_array = []
    book_array << Book.new("Beatrice Potter", "Peter Rabbit", 25)
    book_array << Book.new("Henry Fielding", "Tom Jones", 12)
    book_array << Book.new("Bob Woodward", "All the President's Men", 30)

    puts "Sorting alphabetically by author"

    new_array = book_array.sort do |a, b|
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

    Note the use of the spaceship operator `<=>`.  It does what the commented out
    lines do, but on one line.

    Add to this program. Add additional calls to `book_array.sort` that pass blocks.  For your first
    call to sort, pass a block so that the array is sorted in order of title,
    and print out the array.  For your second call to sort, pass a block so that
    the array is sorted in order of copies, and print out the array.

6. Create a program `block_method.rb`.  It should have a method `do_calc` that calls a block using a `yield` statement.  The yield statement will pass the numbers `7` and `9` to a block, and then `do_calc` will print out the result returned by the yield.  Call the `do_calc` method twice in your program. The first time, pass a block that adds the two numbers. The second time, pass a block that multiplies the two numbers.  Your program should print out `16` and `63`.

7. Using a gem:  To use a gem, you need a `Gemfile`. This is a list of the gems your program requires, so that others can run your program.  While in the directory for this repository, type the following:

    ```shell
    bundle init
    bundle add faker
    ```

    The first line above creates the Gemfile.  The second installs a gem called `faker` and adds a reference to the gem in the Gemfile.  Others who run your program can run `bundle install` to install the same gems used by your program. The Faker gem is used for testing, in that it can generate random names, phone numbers, email addresses, passwords, and so on for use in a test scenario.

    Write a program called `chuck_norris_facts.rb`.  It should have a loop that prompts the user whether they want to know a fact about Chuck Norris.  If so, it displays a random Chuck Norris fact, and then prompts the user again.  If the user declines, the program exits.  You use the `ChuckNorris` module of the Faker gem.  The documentation for Faker is [here.](https://rubydoc.info/github/faker-ruby/faker)  In order to have access to the Faker gem, you need to have the following line in your program:

    ```ruby
    require 'faker'
    ```

    The following line prints out a Chuck Norris fact:

    ```ruby
    puts Faker::ChuckNorris.fact
    ```

    The modules comprising the Faker gem are organized into namespaces.  The `ChuckNorris` module is within the `Faker` module, which is the meaning of the `::` above.  Complete and try your program.

## Submitting Your Work

As usual, you add, commit, and push your changes.  In this case you are pushing the lesson4 branch.  Then you create a pull request for the lesson4 branch, and submit a link to the pull request with your homework.
