require_relative 'my_enumerable_module'

class Array
    include My_Enumberable
end

[1, 2, 3, 4, 5].my_each { |i| puts i*i }
[5, 5, 5, 5, 5].my_each { |i| puts i+i }
[1, 2, 3, 4].my_each { |i| puts i * 10 }
