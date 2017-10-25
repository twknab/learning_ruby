require_relative "mammal"

class Lion < Mammal
  def initialize
    @health = 170
  end

  def fly
    @health -= 10
    self
  end

  def attack_town
    @health -= 50
    self
  end

  def eat_humans
    @health += 20
    self
  end

  def display_health
    puts "This is a lion"
    super # calls parent function, Mammal.display_health
  end
end

zeldar = Lion.new
zeldar.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.display_health
