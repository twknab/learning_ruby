# Modules

=begin
    Enumerable is, by far, the most important module to master in Ruby. It provides collection classes the ability to sort, search and traverse. What is a module? Modules are very similar to Classes. In fact a Module is a superclass of a Class:

        Class.superclass # => Module

    We use a module to group together a collection of variables and methods (very similar to a class). However, we should use a module if it is meant to be included within a class and we should use a class if we are going to instantiate something. What does it mean by including a module?

    # Printer Module
    Let's create our own module and include it within the String class and the Array class. Go ahead and create a new directory called module_practice and create a new file called printer_module.rb with the following contents:

        module Printer
            def print_each_element
                for i in 0...self.length
                  puts self[i]
                end
            end
        end

    Now, let's create another Ruby file called main.rb with the contents below. We are including this module into the Array class and the String class so that its instances can be sent this message:

        require_relative 'printer_module'
        class Array
            include Printer
        end
        class String
            include Printer
        end
        [1,2,3].print_each_element
        "hello".print_each_element

    We could have used a Printer class and have Array and String inherit from it so that the methods are available, but it makes more sense to include a module because a Printer is not really related to an Array or a String.

    # Enumerable
    Enumerable is just a module that is included in Arrays and Hashes. We can verify this by looking at the ancestors. Ancestors contain the list of Classes and Modules that a class inherits/includes.

        Array.ancestors  # => [Array, Enumerable, Object, Kernel, BasicObject]
        Hash.ancestors   # => [Hash, Enumerable, Object, Kernel, BasicObject]

    Arrays and Hashes both have the Enumerable and the Kernel module included. This means that any method declared in these two modules are available to the instances of the Array or Hash class. Arrays and Hashes also inherit from the Object class and the BasicObject class. This is what people mean when they say: in Ruby, everything is an object. If we look at the ancestor chain, it always ends with Object and BasicObject.

        Fixnum.ancestors # => [Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]

    The Enumerable module has many methods that make Ruby very fun to work with. The Enumerable module is equivalent to the underscore library for JavaScript except that it comes pre-baked with Ruby.

    # Method Lookup
    When we send a message to an object, it first looks within its own class if that method exists. If not we move up our ancestor chain to see if that message exists. We keep going up until we either find the message that we know how to respond to or we reach the end of our ancestor chain and say no message (method) was found.

        { hello: "goodbye" }.to_s
=end
