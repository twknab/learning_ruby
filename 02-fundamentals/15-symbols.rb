# Symbols

# Many have viewed symbols as lightweight strings.
# They are prevalent in Ruby.

# Although compared to lightweight strings, there are subtle differences between them.

# When we create a string, we instantiate a String class.

# When we create a symbol, we instantiate a Symbol class.

# However, unlike strings, there can only be ONE unique symbol in your ruby program:

# e.g.)
=begin
    a = "coding"
    b = "coding"
    c = :dojo
    d = :dojo
    puts a.object_id # => 70366642877120
    puts b.object_id # => 70366642877100
    puts c.object_id # => 897948
    puts d.object_id # => 897948
=end

# Notice how the ID of object 'd' is the same as object `c`. This is because both symbols contain the same value.

# There can only ever be one instance of any given symbol.

=begin
# When should we use Symbols?
Since symbols are immutable, they are great identifiers. A classic example of the use of symbols are as keys in a hash:

    user = {first_name: "Coding", last_name: "Dojo"}
    puts user[:first_name] # => "Coding"

Another example is having symbols used as keyword arguments. If you are not familiar with keyword arguments, go back to our Hashes section to learn about them!

Symbols and Strings have their use cases but when our application needs to retrieve and compare values from memory, symbols are much faster.  If you need to do a symbol comparison, you only need to compare the memory address; however, when comparing strings, Ruby needs to check if the sequence of the character are the same.

# Wrapping Up
Once you reach Ruby on Rails, you will see symbols used very often. We recommend that you start using them as you see fit instead of using strings for every occasion.
=end
