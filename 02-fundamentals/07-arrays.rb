# Arrays:
# http://ruby-doc.org/core-2.3.3/Array.html

family = ["Tim", "Julianna", "Chris", "John", "Nancy", "Dojo"]
ages = [33, 28, 29, 67, 72, 9]
things = ["Dojo", 9]
# Another way to define arrays:
stuff = %w{Stapler\ Thing, iPod Headphones Charging cable}

puts family
puts ages
puts ages[2], ages[0]
puts ages[3]*ages[4]
puts stuff

# You can combine arrays:
all = family + ages
# >> ["Tim", "Julianna", "Chris", "John", "Nancy", "Dojo", 33, 28, 29, 67, 72, 9]

# You can delete items from arrays:
all = (family + ages) - things
# will remove `Dojo` and `9` from combined arrays.
# >> ["Tim", "Julianna", "Chris", "John", "Nancy", 33, 28, 29, 67, 72]

# Convert to string:
puts all.to_s

# Challenge: Try the following methods at least once either on a separate Ruby file or on irb.

# .at or .fetch -- returns element at index:
puts family.at(3)
# >> John
puts family.fetch(4)
# >> Nancy

# .delete -- delete something from an array:
family.delete("Tim")
puts family

# .reverse
puts "Reversing array...", family.reverse
# Overwrite old array with reversed one:
# Remember, often w/o a bang (!), a shallow copy only is returned (without your permanenet changes):
family = family.reverse!

# .length -- get length of array:
puts "Length of the array is #{family.length}."

# .sort -- returns new array created by sorting:
numbers = [10, 9, 8, 7, 6]
puts "Sorting...", numbers.sort
puts "Sorting Reverse...", numbers.sort{|x,y| y <=> y}

# .slice -- returns element(s) at an index, from a starting point to a certain length, or in a range:
puts "Slicing...", numbers.slice(2) # index
puts numbers.slice(2,2) # starting point to number of indicies
puts numbers.slice(1..3) # range

# .shuffle -- randomly shuffles
a = [1, 2, 3, 4, 5]
b = a.shuffle
puts "Shuffling...", b

# .join -- joins an array, can accept parameter to display between
tim = ["cool", "fun", "humble"]
puts tim.join(" -- ")
puts tim.join
puts tim.join(" ")
puts tim.join(", ")

life = ["infant", "baby", "youth", "adolescence", "early adulthood", "middle adulthood", "late adulthood", "old age"]
puts life.join("-->")

# .insert - insert a value in an array at a given index:
powers_of_2 = [2, 4, 16, 32, 64]
powers_of_2.insert(2, 8)
puts "Inserting...", powers_of_2

# index of -1 will put at end of array:
powers_of_2.insert(-1, 128)
puts powers_of_2

# values_at() -> returns an array with values belonging to index values specified in the parameters:
hiking = ["water", "headlamp", "warm layers", "rain jacket", "water filter", "extra food"]
puts "Values at...", hiking.values_at(1,3,5)

# Can also chain methods:
# e.g. a = %w{cat dog bear}; puts a.values_at(1,2).join(' and ') #=> "dog and bear"
