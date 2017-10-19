class MathDojo
  def initialize
    @total = 0
    # Note, if we didn't add our total variable to our initialize method, and instead made it a class var (ie, `@@total`), the value would NOT reset each time we instantiated it. Cool and unique!
  end

  def add(*values)
    # Add any number in values array:
    if values.length > 1
      # Flatten array:
      values.flatten!
      # Add each item to total:
      values.each { |e| @total += e }
    else
      values.each { |e| @total += e }
    end
    self
  end

  def subtract(*values)
    # Subtract any number in values array:
    if values.length > 1
      # Flatten array:
      values.flatten!
      # Add each item to total:
      values.each { |e| @total -= e }
    else
      values.each { |e| @total -= e }
    end
    # Return self:
    self
  end

  def result
    @total
  end
end

challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2, 3], [1.1, 2.3]).result

puts challenge1
puts challenge2

# Here's a solution with a much cleaner and more Ruby-esque way of doing things:

class DojoMath
  attr_reader :answer

  def initialize
    @answer = 0
  end

  def add(*numbers)
    @answer += numbers.flatten.reduce(0, :+)
    self
  end

  def subtract(*numbers)
    @answer -= numbers.flatten.reduce(0, :+)
    self
  end
end

challenge3 = DojoMath.new.add(2).add(2, 5).subtract(3, 2).answer
challenge4 = DojoMath.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2, 3], [1.1, 2.3]).answer

puts challenge3
puts challenge4
