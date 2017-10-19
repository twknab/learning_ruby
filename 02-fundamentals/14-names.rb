# Names Assignment:

=begin
    Consider the following code:

        a = {first_name: "Michael", last_name: "Choi"}
        b = {first_name: "John", last_name: "Doe"}
        c = {first_name: "Jane", last_name: "Doe"}
        d = {first_name: "James", last_name: "Smith"}
        e = {first_name: "Jennifer", last_name: "Smith"}
        names = [a, b, c, d, e]

    Create a ruby method that goes over each name in the names array and prints something like below:

        You have 5 names in the 'names' array
        The name is 'Michael Choi'
        The name is 'John Doe'
        The name is 'Jane Doe'
        The name is 'James Smith'
        The name is 'Jennifer Smith'
=end

a = {first_name: "Tim", last_name: "Banks"}
b = {first_name: "Julianna", last_name: "Manniford"}
c = {first_name: "Chris", last_name: "Banks"}
d = {first_name: "Danielle", last_name: "Banks"}
e = {first_name: "John", last_name: "Banks"}
f = {first_name: "Nancy", last_name: "Beeman"}
g = {first_name: "Bobbi", last_name: "Manniford"}
h = {first_name: "Kate", last_name: "Filmar"}
i = {first_name: "Brian", last_name: "Filmar"}
j = {first_name: "Liam", last_name: "Filmar"}
k = {first_name: "Lilly", last_name: "Filmar"}
l = {first_name: "Tom", last_name: "Manniford"}
m = {first_name: "Pete", last_name: "Franken"}
n = {first_name: "Becca", last_name: "Franken"}
o = {first_name: "Billy", last_name: "Manniford"}
p = {first_name: "Kailee", last_name: "Manniford"}
q = {first_name: "Bill", last_name: "Manniford"}
family = [a, b, c, d, e, f, g, h, i , j, k, l, m, n, o, p, q]

def list_family array
    puts "You have #{array.count} family members."
    array.each { |i|  puts "The name is #{i[:first_name]} #{i[:last_name]}" }
end

list_family family
