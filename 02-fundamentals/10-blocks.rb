# Block statements:
def test
    yield(1)
    puts "You are inside the method!"
    yield(2)
end

# `i` becomes any parameter provided to the `yield` statement, and the command line will be run in place of the `yield` statements:
# (what's in the curly brackets is the `block`)
test { |i| puts "You are in the block #{i}" }

# In this next example, we can create a method and run a different block statement, this time passing a variable into the method to be computed:
def square(num)
    puts "num is #{num}"
    puts "yield(num) has a value of #{yield(num)}"
end

# Our block statement, which will run `i*i`, using 5 for `i`
square(5) {|i| i*i }
# >> num is 5
# >> yield(num) has a value of 25

square(10) { |i| i*i }
# >> num is 10
# >> yield(num) has a value of 100

# Another way to write the above is:
square(10) do |i|
    i*i
end
