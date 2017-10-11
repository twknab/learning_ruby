# While Loop
i = 0
num = 5
while i < num do
   puts "Inside the loop i = #{i}"
   i +=1
end

# If you want to escape out of the while loop before it's completed, you can use break:
i = 0
num = 5
while i < num do
  puts "Inside a new loop i = #{i}"
  i += 1
  break if i == 2
end

# For Loop
for i in 0..5
  puts "Value of local variable is #{i}"
end

# Can also break out of our for loop:
for i in 0..5
  puts "Value of local variable in a new for loop is #{i}"
  break if i == 2
end

# Use `next` not to break but to skip to the next index
for i in 0..5
  next if i == 2
  puts "Value of variable is #{i}"
end
