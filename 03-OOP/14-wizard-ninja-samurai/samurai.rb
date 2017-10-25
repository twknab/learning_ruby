require_relative 'Human'

class Samurai < Human
  @@count = 0

  def initialize
    @health = 200
    @@count += 1
    super
  end

  def death_blow(target)
    target.health = 0
  end

  def meditate
    @health = 200
  end

  def how_many
    puts "# of Samurai: #{@@count}"
    @@count
  end
end

gafor = Samurai.new
puts gafor.health

martin = Human.new

gafor.death_blow(martin)
puts gafor.health
puts martin.health

gafor.health = 20
puts gafor.health
gafor.meditate
puts gafor.health

lancelor = Samurai.new

gafor.how_many
lancelor.how_many
