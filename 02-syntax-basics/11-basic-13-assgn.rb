# Assignment: Basic 13

# Solve all 13 problems below in as much of Ruby way as possible.
# Bonus: Try to use as few lines as possible for each question

#####
# 1
#####
# Print 1-255
# Write a program that would print all the numbers from 1 to 255.
def one_to_two_fifty_five
    (1..255).each{ |num| puts num }
end
puts "---- one_to_two_fifty_five ----"
one_to_two_fifty_five # invoke

#####
# 2
#####
# Print odd numbers between 1-255
# Write a program that would print all the odd numbers from 1 to 255.
def odd_numbers
    puts (1..255).find_all { |i| i % 2 == 1 }
end
puts "---- odd_numbers ----"
odd_numbers # invoke

#####
# 3
#####
# Print Sum
# Write a program that would print the numbers from 0 to 255 but this time, it would also print the sum of the numbers that have been printed so far. For example, your output should be something like this:

# New number: 0 Sum: 0
# New number: 1 Sum: 1
# New number: 2 Sum: 3
# New number: 3 Sum: 6
# ...
# New number: 255 Sum: __
# Do NOT use an array to do this exercise.
def print_sum
    sum = 0
    (1..255).each { |num| puts "New number: #{num} Sum: #{sum += num}" }
end
puts "---- print_sum ----"
print_sum # invoke

#####
# 4
#####
# Iterating through an array
# Given an array X, say [1,3,5,7,9,13], write a program that would iterate through each member of the array and print each value on the screen. Being able to loop through each member of the array is extremely important.
puts "---- iterate ----"
nums = %w{1 3 5 7 9 13}
more_nums = [3, 9, 7, 1, 2]
def iterate_array array
    array.each{ |num| puts "The number is #{num}" }
end
iterate_array nums # invoke
iterate_array more_nums # invoke

#####
# 5
#####
# Find Max
# Write a program (sets of instructions) that takes any array and prints the maximum value in the array. Your program should also work with a given array that has all negative numbers (e.g. [-3, -5, -7]), or even a mix of positive numbers, negative numbers and zero.
puts "---- find max ----"
def find_max arr
    puts arr.max
end
find_max [1, 222, 3, 4, 5]
find_max [12331, 9, 5, 2, 1]

#####
# 6
#####
# Get Average
# Write a program that takes an array, and prints the AVERAGE of the values in the array. For example for an array [2, 10, 3], your program should print an average of 5. Again, make sure you come up with a simple base case and write instructions to solve that base case first, then test your instructions for other complicated cases. You can use a length function with this assignment.
puts "---- get_avg ----"
def get_average arr
    sum = 0
    arr.each { |num| sum += num }
    puts sum
    puts arr.length
    puts "The average is: #{sum/arr.length}"
end
get_average [1, 2, 3, 4, 5]
get_average [6, 7, 8, 9, 10]
get_average [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

#####
# 7
#####
# Array with Odd Numbers
# Write a program that creates an array 'y' that contains all the odd numbers between 1 to 255. When the program is done, 'y' should have the value of [1, 3, 5, 7, ... 255].
puts "---- array odd nums ----"
def odd_array
    puts Array (1..255).select { |num| num.odd? }.to_s
end
odd_array # invoke

#####
# 8
#####
# Greater Than Y
# Write a program that takes an array and returns the number of values in that array whose value is greater than a given value y. For example, if array = [1, 3, 5, 7] and y = 3, after your program is run it will print 2 (since there are two values in the array that are greater than 3).

# Note: I ended up misunderstanding the directions and created a slightly different algorithm. See down below for accurate algorithm:
puts "---- greater than y ----"
def gt_than_y array, y
    for i in array
        if i.to_i == y  # note: must convert `i` to fixenum
            found = array.slice(array.index(i), array.length-1).to_s
            puts found
        end
    end
    puts "The number `y` was not found." unless found # in case not found
end
gt_than_y %w{1 2 3 4 5 6}, 3
gt_than_y %w{9 10 15 23 45 2 3}, 45
gt_than_y %w{56 233 345 23 23}, 233
gt_than_y %w{3 4 5 6 7 8 9}, 2

def greater_than_y array, y
    contained = array.any? { |number| number == y }
    puts array.slice(array.index(y), array.length-1).to_s unless !contained
    puts "The number #{y} was not found in the array." unless contained
end

greater_than_y [10, 9, 8, 7, 6, 5, 4, 3], 4
greater_than_y [10, 9, 8, 7, 6, 5, 4, 3], 100

#####
# 9
#####
# Square the values
# Given any array x, say [1, 5, 10, -2], create an algorithm (sets of instructions) that multiplies each value in the array by itself. When the program is done, the array x should have values that have been squared, say [1, 25, 100, 4].
puts "---- square the values ----"
def square_values array
    puts array.collect{ |num| num*num }.to_s
end
square_values [1, 2, 3, 4, 5]

#####
# 10
#####
# Eliminate Negative Numbers
# Given any array x, say [1, 5, 10, -2], create an algorithm that replaces any negative number with the value of 0. When the program is done, x should have no negative values, say [1, 5, 10, 0].
puts "---- eliminate negative ----"
def eliminate_negative array
    for i in array
        if i < 0
            array[array.index(i)] = 0
        end
    end
    return array.to_s
end
puts eliminate_negative [1, 2, 3, -5, 3]
puts eliminate_negative [-1, -2, -3, -5, 3]


#####
# 11
#####
# Max, Min, and Average
# Given any array x, say [1, 5, 10, -2], create an algorithm that returns a hash with the maximum number in the array, the minimum value in the array, and the average of the values in the array.
puts "---- max, min, avg ----"
def max_min_avg array
    sum = 0
    max = array.max
    min = array.min
    array.each { |i| sum += i }
    avg = sum/(array.length-1)
    puts "Max: #{max}, Min: #{min}, Avg: #{avg}"
end
max_min_avg [1, 2, 3]
max_min_avg [9, 8, 1, 5, 15]
max_min_avg [108, 800, 112, 523, 150]
max_min_avg [11, 22, 33, 43]

#####
# 12
#####
# Shifting the Values in the Array
# Given any array x, say [1, 5, 10, 7, -2], create an algorithm that shifts each number by one to the front. For example, when the program is done, an x of [1, 5, 10, 7, -2] should become [5, 10, 7, -2, 0].
puts "---- shifting ----"
def shifting array
    array.shift
    array.insert(-1, 0)
    return array.to_s
end
puts shifting [1, 2, 3, 4, 5]
puts shifting [2, 3, 4, 5, 0]

#####
# 13
#####
# Number to String
# Write a program that takes an array of numbers and replaces any negative number with the string 'Dojo'. For example, if array x is initially [-1, -3, 2] after your program is done that array should be ['Dojo', 'Dojo', 2].
puts "---- number to string ----"
def number_to_string array
    for i in array
        if i < 0
            array[array.index(i)] = "Dojo"
        end
    end
    return array.to_s
end
puts number_to_string [-1, 2, -3, 4, -5]


#####
# Solutions
#####

# Here's the dojo official solutions:

# Print 1-255
# Write a program that would print all the numbers from 1 to 255.

(1..255).each { |i| puts i }

# Print odd numbers between 1-255
# Write a program that would print all the odd numbers from 1 to 255.

(1..255).each { |i| puts i if i.odd? }

# Print Sum
# Write a program that would print the numbers from 0 to 255 but this time, it would also print the sum of the numbers that have been printed so far. For example, your output should be something like this:

sum = 0
(0..255).each { |i| puts "New Number: #{i} Sum: #{sum += i}"}

# Iterating through an array
# Given an array X, say [1,3,5,7,9,13], write a program that would iterate through each member of the array and print each value on the screen. Being able to loop through each member of the array is extremely important.

[1,3,5,7,9,13].each { |elem| puts elem }

# Find Max
# Write a program  that takes any array and prints the maximum value in the array. Your program should also work with a given array that has all negative numbers (e.g. [-3, -5, -7]), or even a mix of positive numbers, negative numbers and zero.

puts [-3,-5,-7].max

# Get Average
# Write a program that takes an array, and prints the AVERAGE of the values in the array. For example for an array [2, 10, 3], your program should print an average of 5. Again, make sure you come up with a simple base case and write instructions to solve that base case first, then test your instructions for other complicated cases. You can use a length function with this assignment.

arr = [2,10,3]
puts arr.reduce(:+) / arr.length.to_f

# Array with Odd Numbers
# Write a program that creates an array 'y' that contains all the odd numbers between 1 to 255. When the program is done, 'y' should have the value of [1, 3, 5, 7, ... 255].

y = []
(1..255).each { |i| y << i if i.odd? }

# Greater Than Y
# Write a program that takes an array and returns the number of values in that array whose value is greater than a given value y. For example, if array = [1, 3, 5, 7] and y = 3, after your program is run it will print 2 (since there are two values in the array that are greater than 3).

arr = [1, 3, 5, 7]
y = 3
puts arr.count { |elem| elem > y }

# Square the values
# Given any array x, say [1, 5, 10, -2], create an algorithm (sets of instructions) that multiplies each value in the array by itself. When the program is done, the array x should have values that have been squared, say [1, 25, 100, 4].

arr = [1, 5, 10, -2]
puts arr.map! { |elem| elem * elem }


# Eliminate Negative Numbers
# Given any array x, say [1, 5, 10, -2], create an algorithm that replaces any negative number with the value of 0. When the program is done, x should have no negative values, say [1, 5, 10, 0].

arr = [1, 5, 10, -2]
puts arr.each_index { |index| arr[index] = 0 if arr[index] < 0 }

# Max, Min, and Average
# Given any array x, say [1, 5, 10, -2], create an algorithm that returns a hash with the maximum number in the array, the minimum value in the array, and the average of the values in the array.

arr = [1, 5, 10, -2]
{ max: arr.max, min: arr.min, average: arr.reduce(:+) / arr.length.to_f }

# Shifting the Values in the Array
# Given any array x, say [1, 5, 10, 7, -2], create an algorithm that shifts each number by one to the front. For example, when the program is done, an x of [1, 5, 10, 7, -2] should become [5, 10, 7, -2, 0].

arr = [1, 5, 10, 7, -2]
arr.rotate!(1)[arr.length-1] = 0

# Number to String
# Write a program that takes an array of numbers and replaces any negative number with the string 'Dojo'. For example, if array x is initially [-1, -3, 2] after your program is done that array should be ['Dojo', 'Dojo', 2].

arr = [-1, -3, 2]
puts arr.each_index { |index| arr[index] = "Dojo" if arr[index] < 0 }
