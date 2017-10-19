# Variables:

# Local Variable
# - A regular variable in Ruby.

# Instance Variable
# - Begins with @ and are available to instances of the class.

# Class Variable
# - Begins with @@ and are available to the class itself

# Global Variable
# - Begins with $. Avoid using this, if possible, since it is available everywhere.

# Regular variable:
name = 'Tim'

# Global variable:
$fav_color = 'Blue'

# Class Example and instance and class variables:
class CodingDojo
  @@no_of_branches = 0 # class variable
  def initialize(id, name, address)
    @branch_id = id # instance variable
    @branch_name = name
    @branch_address = address
    @@no_of_branches += 1
    puts "Created branch #{@@no_of_branches}"
  end

  def hello
    puts 'Hello CodingDojo!'
  end

  def display_all
    puts "Branch ID: #{@branch_id}"
    puts "Branch Name: #{@branch_name}"
    puts "Branch Address: #{@branch_address}"
  end
end

# now using above class to create objects
branch = CodingDojo.new(253, 'SF CodingDojo', 'Sunnyvale CA')
branch.display_all
branch2 = CodingDojo.new(155, 'Boston CodingDojo', 'Boston MA')
branch2.display_all
