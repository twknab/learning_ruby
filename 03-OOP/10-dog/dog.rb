require_relative 'mammal'

class Dog < Mammal
  def pet
    @health += 5
    self
  end
  def walk
    @health -= 1
    self
  end
  def run
    @health -= 9
    self
  end
end

shadow = Dog.new
shadow.walk.walk.walk.run.run.pet.display_health
