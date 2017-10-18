# This is an example of module practice. We're going to create a module below, and then include our module into our `main.rb` file:

module Printer
    def print_each_element
        for i in 0...self.length
            puts self[i]
        end
    end
end
