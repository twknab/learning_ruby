# Assignment: Project
# Create a Project Class that has the following attributes: name, description. Also, create a instance method called elevator_pitch that will print out the name of the project and its description separated by a comma.

=begin

Example:

class Project
  # your code here
end

project1 = Project.new("Project 1", "Description 1")
puts project1.name # => "Project 1"
project1.elevator_pitch  # => "Project 1, Description 1"

=end


class Project
  attr_reader :name # this let's us "read" the :name attr

  def initialize(name, description)
    @name = name
    @description = description
  end

  def elevator_pitch
    puts "Project name: #{@name}"
    puts "Project description: #{@description}"
  end
end

new_app = Project.new("My App", "Very helpful tool.")
puts new_app.name
new_app.elevator_pitch
