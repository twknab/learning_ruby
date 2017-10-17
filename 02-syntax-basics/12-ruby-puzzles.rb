# Ruby Puzzles

# Create an array with the following values: 3,5,1,2,7,9,8,13,25,32. Print the sum of all numbers in the array. Also have the function return an array that only include numbers that are greater than 10 (e.g. when you pass the array above, it should return an array with the values of 13,25,32 - hint: use reject or find_all method)

puts "---- #1 ----"
def problem_one array
    sum = 0
    array.each { |e| sum += e }
    puts "The array is: #{array.to_s}"
    puts "The sum is: #{sum}"
    array.reject! { |i| i <= 10 }
    puts "Array greater than 10: #{array}"
    puts "----"
    return array
end

arr1 = [3,5,1,2,7,9,8,13,25,32]
arr2 = [12,40,10,-2,10,40,14,12]
problem_one arr1
problem_one arr2

# Create an array with the following values: John, KB, Oliver, Cory, Matthew, Christopher. Shuffle the array and print the name of each person. Have the program also return an array with names that are longer than 5 characters.

puts "---- #2 ----"
def problem_two array
    puts "The array is: #{array}"
    array.shuffle!
    puts "The array shuffled is: #{array.to_s}"
    array.reject! { |r| r.length <= 5 }
    puts "Array values longer than 5 characters: #{array}"
    return array
end

problem_two ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
problem_two ["Tim", "Julianna", "Chris", "Danielle", "Kate", "Bobbi"]

# Create an array that contains all 26 letters in the alphabet (this array must have 26 values). Shuffle the array and display the last letter of the array. Have it also display the first letter of the array. If the first letter in the array is a vowel, have it display a message.

puts "---- #3 ----"
def problem_three array
    puts "The array is: #{array.to_s}"
    array.shuffle!
    puts "The array has been shuffled."
    puts array.to_s
    puts "The last letter in the shuffled array is: #{array[array.length-1]}"
    puts "The first letter in the shuffled array is: #{array.first}"
    if (array.first.scan(/[aeiouy]/)).length == 1
        puts "A vowel has been detected as the first letter! It's #{array.first}."
    end
    return array
end

problem_three ('a'..'z').to_a

# Generate an array with 10 random numbers between 55-100.
puts "---- #4 ----"
def problem_four
    array = Array.new(10)
    for i in 0..9
        array[i] = rand(55..100)
    end
    puts array.to_s
    return array
end
problem_four

# Generate an array with 10 random numbers between 55-100 and have it be sorted (showing the smallest number in the beginning). Display all the numbers in the array. Next, display the minimum value in the array as well as the maximum value
puts "---- #5 ----"
def problem_five
    array = Array.new
    for i in 0..9
        array.push(rand(55..100))
    end
    array.sort!
    puts "The array sorted is: #{array.to_s}"
    puts "The min value is: #{array.min}"
    puts "The max value is: #{array.max}"
    return array
end
problem_five

# Create a random string that is 5 characters long (hint: (65+rand(26)).chr returns a random character)
puts "---- #6 ----"
def problem_six
    array = Array.new
    for i in 0..4
        array.push((65+rand(26)).chr)
    end
    puts "The random string is: #{array.join}"
    return array.join
end
problem_six

# Generate an array with 10 random strings that are each 5 characters long
puts "---- #7 ----"
def problem_seven
    array = Array.new(10)
    for i in 0..9
        string = Array.new(5)
        for j in 0..4
            string[j] = ((65+rand(26)).chr)
        end
        array[i] = string.join
    end
    puts array.to_s
    return array.to_s
end
problem_seven
