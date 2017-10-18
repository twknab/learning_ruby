# This is our main ruby file. In this practice assignment, we're going to practice importing a module and invoking it:

require_relative 'printer_module' # this line imports our module

class Array
    include Printer # we are adding the `Printer` module to our already existing Array class, extending its built in methods.
end

class String
    include Printer # we are adding the `Printer` module to our already existing String class, extending its built in methods.
end

[1,2,3].print_each_element  # now we can invoke our Printer module methods, such as the `print_each_element` method
"hello".print_each_element # and beacuse we added our custom method to already existing classes, we can use this on strings too.
