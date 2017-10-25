require_relative 'Human'

class Wizard < Human
  attr_reader :health

  def initialize
    @health = 50
    @intelligence = 25
    super
  end

  def heal
    @health += 10
  end

  def fireball(target)
    puts "Wizard launching Fireball!"
    target.decrease_health(20)
    puts target.health
  end
end


tim = Human.new
zandor = Wizard.new

puts tim
puts zandor
zandor.fireball(tim)
zandor.fireball(tim)
