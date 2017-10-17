# If / else statements:
x=5

if x > 2
    puts "x is greater than 2"
elsif x < 2 and x > 0
    # notice that elsif is spelled differently than python:
    puts "x is 1"
else
    puts "I can't guess the number."
end

# Can also write it inline like this:
puts "x is not 2" if x != 2
puts "x is greater than 2" if x > 2

# Also is an unless statement:
puts "x is not 2" unless x == 2


age = 33

case age  # defines what the when statements will analyze
when 0..2
    puts "baby"
when 3..5
    puts "little child"
when 7..12
    puts "child"
when 13..18
    puts "youth"
else
    puts "adult"
end


unless age < 21
    puts "Welcome to the party."
else
    puts "Not yet."
end

# Inline unless statement
puts "You're old enough" unless age < 21
