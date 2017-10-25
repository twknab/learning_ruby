class Human
  attr_reader :health

  def initialize
    @strength = 3
    @stealth = 3
    @intelligence = 3
    @health = 100
  end

  def decrease_health
    @health -= 20
    self
  end

  def attack(target)
    if target.class.ancestors.include?(Human)
      puts "This is a human...attacking!"
      target.decrease_health
      puts target.health
    else
      puts "Cannot attack, target is not a human!"
    end
    self
  end
end

class Fish
  def initialize
    @health = 100
    @intelligence = 1
    @stealth = 10
    @strength = 1
  end
end

tim = Human.new
foe = Human.new
flipper = Fish.new
tim.attack(foe)
tim.attack(flipper)
