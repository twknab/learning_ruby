# Self

# `Self` refers to whatever object called that method. In Ruby, everything is an object so `self` can be many different things, depending upon which object called a method.

# If I'm an instance of User, and I call a method, `self` in this case, will be not the User class, but just my particular instance, and the properties belonging to that instance.

# Let's explore more below:

class Fixnum
  def who_am_i
    puts self
  end
end

class String
  def who_am_i
    puts self
  end
end

3.who_am_i
15.who_am_i
"string".who_am_i
"hello_world".who_am_i

# Let's create a Mammal class and use `self` in our own class:

class Mammal
  def initialize
    puts "I am alive! Muhaha!"
    self
  end
  def breath
    puts "...inhale...exhale..."
    self
  end
  def who_am_i
    # printing current object:
    puts self
    self
  end
end

my_mammal = Mammal.new
my_mammal.who_am_i
my_mammal.who_am_i.breath # this will return an undefined method error (if `self` is removed from the `who_am_i` method) because whenever we use a `puts` statement, nil is returned. Thus, we cannot chain `who_am_i` as the returned value is `nil`, therefor `breath` is not a possesed method of a `nil` value. However, if we add a `self` statement to the end of each instance method, `self` will be returned (remember, the last line in the method is always returned), and methods can then be chained.
