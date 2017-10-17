# Hashes

# Here's one way to create hashes, which are key-value pairings:
h = {"first_name" => "Tim", "last_name" => "Knab"}
puts h["first_name"], h["last_name"]

# You can use the `.eql?` method to check a key value:
puts "Your last name is Knab" if h["last_name"].eql? "Knab"

# Here's another way to create hashes:
y = {:first_name => "Tim", :last_name => "Knab"}
puts "Y is", y
puts y[:first_name], y[:last_name]

# You can delete a key and value pair this way using `.delete()` method:
puts "DELETING :first_name"
y.delete(:first_name)
puts "Y is now:", y

# You can use the `.has_key?()` method:
if y.has_key?(:first_name)
    puts "Y has a key called :first_name"
else
    puts "Y does not have a key called :first_name"
end

# You can use the `has_value?()` method to see if a hash contains a certain value:
if y.has_value?("Knab")
    puts "Your last name is Knab."
end

# Here's of course the most basic way and standard way to create a hash:
our_hash = {first_name: "Tim", last_name: "Knab"}
puts our_hash

# Using hashes as an input:
# An older method is as such:

def my_method my_name = {first_name: "Tim", last_name: "Knab"}
    puts "Welcome to my site, #{my_name[:first_name]} #{my_name[:last_name]}!"
end

# Can run method and default hash will be passed:
my_method

# However, if a new hash is passed, this will overwrite the old values:
my_method new_person = {first_name: "Julianna", last_name: "Giles"}

# Here's a cleaner and better way to write the same thing above:
def my_new_method first_name: "Tim", last_name: "Knab"
    puts "Welcome to our site, #{first_name} #{last_name}!"
end

# Will again print default values:
my_new_method

# And so too, will print new values if provided:
my_new_method first_name: "Julianna", last_name: "Giles"
