# Iterators

# Iterators are extremely important for Ruby. Please go through each of these functions through Ruby's official documentation and build a single ruby file where you go through each of the following Ruby functions. This will be listed in one of the assignments below.

northwest_animals = ["Black Bear", "Cougar", "Douglas Squirrel", "Columbia Black Tailed Deer", "Elk", "Flying Squirrel", "Cormorant", "Orca Whale", "Humpback Whale"]

# .any? { |obj| block } => true or false
# e.g. ["ant", "bear", "cat"].any? { |word| word.length >= 3 } # => true
# Analyses an array for any condition provided:
puts "Any -----------"
puts northwest_animals.any? { |word| word.length >= 3 }
puts northwest_animals.any? { |animal| animal == "Black Bear" }
puts northwest_animals.any? { |bird| bird == "Commodore" }
# Note that `|this word|` is just a variable reference for your conditional statement -- it will be each object of the array


# .each => calls block once for each element in ruby self, passing that element as a block parameter.
# e.g. ["ant", "bear", "cat"].each { |word| print word, "--" } # => ant--bear--cat--
# Does something to each item in an array:
puts "Each -----------"
northwest_animals.each { |animal| print animal, " and " unless animal == "Humpback Whale"}


# .collect { |obj| block } => returns a new array with the results of running block once for every element in enum
# e.g. (1..4).collect { |i| i*i } # => [1, 4, 9, 16]
# e.g. (1..4).collect { "cat" } # => ["cat", "cat", "cat", "cat"]
northwest_animals.collect! { |animal| animal + "!" }
puts "\nCollect -----------", northwest_animals


# .detect/.find => returns the first for which block is not false.
# e.g. (1..10).detect { |i| i %5 == 0 and i % 7 == 0 } # => nil
# e.g. (1..100).detect { |i| i %5 == 0 and i % 7 == 0 } # => 35
puts "Detect -----------"
puts (1..2000).detect { |i| i % 3 == 0 and i % 6 == 0 }
puts "Find -----------"
puts (1..2000).find { |i| i / 4 == 4 } # find where i/4=16


# .find_all { |obj| block } or .select { |obj| block } => returns an array containing all elements of enum for which block is not false
# e.g. (1..10).find_all { |i| i % 3 == 0 } # => [3, 6, 9]
puts "Find all -----------"
puts (1..25).find_all { |i| i % 3 == 0 }


# .reject { |obj| block } => opposite of find_all
# e.g. (1..10).reject { |i| i % 3 == 0 } # => [1, 2, 4, 5, 7, 8, 10]
puts "Reject -----------"
puts (1..25).reject { |i| i % 3 == 0 }


# .upto(limit) => iterates block up to the int number
# e.g. 5.upto(10) { |i| print i, " " } # => 5 6 7 8 9 10
puts "Up to -----------"
1.upto(5) { |i| puts i*5 }
