# Classes in Ruby have two types of Methods:

# 1) Class methods are called on the Class
# 2) Instance methods are called on the instance of the Class.

# Instance methods are just regular methods inside of our class, here's na example:

class MyClass
  def some_method
    puts 'This is an instance method.'
  end
end

something = MyClass.new
something.some_method

# Whenever we use `attr_reader`, `attr_writer`, or `attr_accessor`, we are creating instance methods and getting and setting attributes accordingly.

# We can also create our own instance methods:

class User
  # Create instance methods that get and set the first and last name attributes:
  attr_reader :first_name, :last_name

  # Our initiliazation method:
  def initialize(f_name, l_name)
    @first_name = f_name
    @last_name = l_name
  end

  def full_name
    puts "I am #{@first_name} #{@last_name}."
  end

  def say_hello
    puts 'Hello!'
  end
end

u = User.new('John', 'Doe')
puts u.first_name
u.full_name
u.say_hello

# Class methods are declared the same way, except we use `self.` before them, and these are executed at the Class level and not available to instances.

class Message
  attr_accessor :title, :message

  def initialize(title, message)
    @title = title
    @message = message
  end

  def self.foo
    puts 'This is a class method.'
  end
end

m = Message.new('Testing', 'This is just a test.')
# m.foo => Will throw error, as foo not a valid method of `m` (the instance)
Message.foo # => "This is a class method". Will run the method belonging to the class `Message`.
