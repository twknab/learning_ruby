# Introduction to classes:

# Classes are an object and allow us to create a blue print ti create other instances of it.

class User
  # Ruby classes require a setter:
  def set_first_name(name)
    @first_name = name
  end

  # And a getter:
  def get_first_name
    @first_name
  end
end

# However, this takes a lot more code, as we have to instantiate everything manually.
user1 = User.new
user2 = User.new

user1.set_first_name('Tim')
user2.set_first_name('Julianna')

puts user1.get_first_name
puts user2.get_first_name

# An easier way to write our getter and setter methods is as follows:

class FastUser
  # Create our getter and setter methods:
  attr_accessor :last_name, :last_name
  # Create our init method:
  def initialize(f_name, l_name)
    @first_name = f_name
    @last_name = l_name
  end

  # We can create other instance methods here:
  def to_s
    "The name is: #{@first_name} #{@last_name}"
  end
end

user3 = FastUser.new('Tim', 'Knab')
puts user3.to_s
