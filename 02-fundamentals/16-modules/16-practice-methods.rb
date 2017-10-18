# Challenge: Useful Methods

# Here is a list of useful enumerable methods. Try all of the methods at least once:

#.any? { |obj| block } => true or false
puts "---- #1 .any? ----"
arr1 = ["This", "is", "a", "test", "I", "repeat", "just", "a", "test"]
hash1 = {test: "This is", just: "a test"}
puts arr1.any?{ |i| i == "test" }
puts hash1.any?{ |j| j.length > 1 }

# .collect { |obj| block } => returns a new array with the results of running block once for every element in enum

# e.g. ruby (1..4).collect { |i| i*i } # => [1, 4, 9, 16]

# e.g. ruby (1..4).collect { "cat" } # => ["cat", "cat", "cat", "cat"]
puts "---- #2 .collect? ----"
puts (1..10).collect { |i| i*i }

# .detect/.find => returns the first for which block is not false.

# e.g. ruby (1..10).detect { |i| i %5 == 0 and i % 7 == 0 } # => nil

# e.g. ruby (1..100).detect { |i| i %5 == 0 and i % 7 == 0 } # => 35
puts "---- #3 .detect / .find ----"
arr = ["This", "is", "only", "a", "test"]
puts arr.detect { |i| i == "test" }

# .find_all { |obj| block } or .select { |obj| block } => returns an array containing all elements of enum for which block is not false

# e.g. ruby (1..10).find_all { |i| i % 3 == 0 } # => [3, 6, 9]
puts "---- #4 .find_all ----"
camping_stuff = ["Socks", "Gloves", "Helmet", "Skis", "Socks"]
puts camping_stuff.find_all { |item| item == "Socks" }.to_s


# .reject { |obj| block } => opposite of find_all

# e.g. ruby (1..10).reject { |i| i % 3 == 0 } # => [1, 2, 4, 5, 7, 8, 10]
puts "---- #5 .reject ----"
cake_stuff = ["Flour", "Sugar", "Baking Soda", "Sardines"]
puts cake_stuff.reject { |i| i == "Sardines" }.to_s
