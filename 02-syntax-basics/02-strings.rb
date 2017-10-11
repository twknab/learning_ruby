# Strings

# We can define strings in several different ways in Ruby:

myString = "I'm a shiny new Ruby string object!"
puts myString

# We can check the class of our created instance:
puts myString.class

# We can also create a string this way, long-hand:
myString2 = String.new("I'm another brand spankin' new string!")
puts myString2

# Check out this link for a bunch of cool string methods:
# http://ruby-doc.org/core-2.2.2/String.html

camelCase = "tHiS iS CaMelCase"
puts camelCase
camelCase.downcase!
puts camelCase + " no more!"

# Use of `.empty?` - returns boolean value:
hat = ""
shoes = "merrel"
puts hat.empty?
puts shoes.empty?

# Get string length:
name = "Timothy"
puts name.length

# Split
first = "Tim"
email = "tim@knab.com"
puts first.split
puts first.split("")
puts email.split("@")

# The `!` (bang) is needed to make a deep change:
word = "hello"
puts word.capitalize
puts word
# the change is only shallow, however:
puts word.capitalize!
puts word
# creates a deep change

# Can also change index values of our strings:
noun = "bar"
noun[0] = "c"
puts noun
