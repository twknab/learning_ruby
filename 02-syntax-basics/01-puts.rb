
# Prints with a new line:
puts "hello"
puts "Coding"
puts "Dojo"

# Multi-line comment:

=begin
    This is a long comment,
    that might take up lots of lines
    which is cleaner than having a pound sign
    before every line
=end


# Will run code at the beginning:
BEGIN {
    puts "---This is in the begin block---"
}


# Will run code at the end:
END {
    puts "---This is in the end block.---"
}


# Some more exercises:

x = 5
y = 10
z = x * y

# We don't need semi-colons like JS

puts z
# >> 50

# However, we can use semi-colons to condense multiple lines into one:
a = 3; b = 6; c = a * b;

puts c

# You will notice though that `put` always breaks the line:

# We can avoid a line break like this:

first_name = "Tim"
last_name = "Knab"
puts "My name is " + first_name + " " + last_name

# Or, we can even write it this way, similar to JS ES6:

puts "My name is #{first_name} #{last_name}!"

# You can also write it this way, similar to Python (note `%s` for string):
puts "My name is %s %s :)" % [first_name, last_name]

# Note %d for decimal, %f for float:
age = 33
version = 3.0
puts "My age is %d" % age
puts "My version is %f" % version

# You can add quotations by using the back slash character:
puts "My height is 6' 0\"."
