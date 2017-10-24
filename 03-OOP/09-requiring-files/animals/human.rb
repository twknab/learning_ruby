puts "I am the human file!"
require_relative 'mammal'

class Human < Mammal
  def take_a_breath
    breath
  end
  def eat_vegetable
    puts "Bites a carrot..."
    eat
  end

  def change_clothes
    puts "Changing outfit..."
    change_underwear
  end

  private

  def change_underwear # this is a private function
    puts "Changing underwear!"
  end
end

human = Human.new
human.take_a_breath
human.eat_vegetable
human.change_clothes
