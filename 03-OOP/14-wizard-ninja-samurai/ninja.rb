require_relative "Human"

class Ninja < Human
  attr_reader :health

  def initialize
    @stealth = 175
    super
  end

  def steal(target)
    puts "Stealing!"
    target.decrease_health(10)
    @health += 10
  end

  def get_away
    puts "Getting away...!"
    @health -= 15
  end
end

timothy = Ninja.new
timmer = Human.new
puts timothy.get_away
timothy.steal(timmer)
