# Visibility & Inheritance

# By default, all methods in Ruby classes are public. So far, we have only created public methods. However, there are 3 kinds of methods: public, protected, and private. If you have background in Java or C++, protected and private do not work how you would expect. Ruby has designed visibility differently.
#
#   + public - methods that can be called within the class, subclasses and instances without restriction.
#
#   + protected - methods that can only be called within the class and subclasses either explicitly or implicitly
#
#   + private - methods that can only be called within the class and subclasses implicitly
#
# To understand these definitions we need to introduce the concept of Inheritance. A class can inherit methods from parent class. When a class inherits from a parent class, it is called a child class or subclass. Let's look at some examples:

# Public
class Mammal
  def breath
    puts 'Inhale and exhale'
  end

  def eat
    puts 'Yum yum yum'
  end
end
class Human < Mammal # Human inherits from Mammal
  def subclass_method
    breath
  end

  def another_method
    eat
  end
end
person = Human.new
person.subclass_method # => "Inhale and exhale"
person.another_method # => "Yum yum yum"

# Protected
# To create protected methods, we can do the following:

class Mammal
  # previous code removed for brevity

  def calling_speak
    speak
  end

  protected

  def speak
    puts 'I am a protected method'
  end
end
class Human < Mammal
  # previous code removed for brevity

  def explicitly_speak
    speak
  end

  def implicitily_speak
    speak
  end
end
mammal = Mammal.new
# mammal.speak # => protected method `speak' called for #<Mammal:0x007fa5438183d8> (NoMethodError)
mammal.calling_speak # => I am a protected method
person = Human.new
# person.speak # => protected method `speak' called for #<Human:0x007fedfe824710> (NoMethodError)
person.explicitly_speak # => I am a protected method
person.implicitily_speak # => I am a protected method

# Private
# To create private methods, we can do the following:

class Mammal
  # previous code removed for brevity

  def calling_cry
    cry
  end

  private

  def cry
    puts 'Sniff sniff...'
  end
end
class Human < Mammal
  # previous code removed for brevity

  def explicitly_cry
    cry
  end

  def implicitly_cry
    cry
  end
end
mammal = Mammal.new
mammal.calling_cry # => Sniff sniff...
# mammal.cry # => private method `cry' called for #<Mammal:0x007fd9830de5f8> (NoMethodError)
person = Human.new
# person.cry # => private method `cry' called for #<Human:0x007f8f298de248> (NoMethodError)
person.explicitly_cry # => `explicitly_cry': private method `cry' called for #<Human:0x007f87a30bf450> (NoMethodError)
person.implicitly_cry # => Sniff sniff...
