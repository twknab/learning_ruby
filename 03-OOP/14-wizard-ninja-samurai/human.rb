class Human
  attr_accessor :health

  def initialize
    @strength = 3
    @stealth = 3
    @intelligence = 3
    @health = 100
  end

  def decrease_health(value)
    @health -= value
    self
  end

  def get_health
    puts "Getting health!"
    puts @health.class
    @health
  end

  def attack(target)
    # Check to see if target is a human class:
    if target.class.ancestors.include?(Human)
      puts "This is a human...attacking!"
      target.decrease_health(20)
      puts target.health
    else
      puts "Cannot attack, target is not a human!"
    end
    self
  end

end

tim = Human.new
foe = Human.new
