# Creating methods is similar to other languages:
def hello_world # always use snake_case (ie, all_lower_case_with_underscores)
    puts "Hello world!"
end

# Runs method:
hello_world

# With inputs:
def say_hello name1, name2
    puts "Hello #{name1} and #{name2}!"
end

# Invoke our method:
say_hello("Tim", "Julianna")

# Can also write it with parenthesis:
def say_hello_again(name1, name2)
    puts "Hey there #{name1} and #{name2} :)"
end

# Invoke our method:
say_hello_again("Chris", "John")


# You can create default parameters:
def say_howdy name1="Oscar", name2="Shayna"
    puts "Howdy #{name1} and #{name2}, nice to meet you!"
end

# Invoke our method:
say_howdy

# In Ruby, you don't have to always write a return statement (although you will soemtimes). Instead, whatever was evaluated last will be returned. Unfortunately, because `puts` method returns `nil`, let's change up our methods a bit:

def say_whatup(name1="Timmah", name2="Jimmah")
    "Whatup, #{name1} and #{name2}, what's happenin'?"
end

# Use puts to invoke the method instead, as the previous string will have been returned:
puts say_whatup
# >> "Whatup, Timmah and Jimmah, what's happenin'?"

# Example of using return statement like normal:
def say_word name1, name2
    if name1.empty? or name2.empty?
        return "I'm sorry, I couldn't hear you, can you repeat that?"
    end
    "Word, #{name1} and #{name2}, what is up?"
end

puts say_word "",""
# >> "I'm sorry, I couldn't hear you, can you repeat that?"

puts say_word "Tim", "Julianna"
# >> "Word, Tim and Julianna, what is up?"
