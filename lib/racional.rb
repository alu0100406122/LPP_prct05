
require "./gcd.rb"

class Racional
  
  attr_accessor :num, :den, :x, :y
  
  def initialize(num, den)
    @num, @den = num, den
  end
  
  def to_s
    "(#{@num},#{@den})"
  end
  
  def * (value)
    Racional.new(@num * value, @den)
  end
  
  def * (other)
    Racional.new(@num * other.num, @den * other.den)
  end
  
  def / (other)
    Racional.new(@num * other.den, @den * other.num)
  end
  
  def + (other)
    @num = (@num / gcd(@num, @den))
    @den = (@den / gcd(@num, @den))
    other.num = (other.num / gcd(other.num, other.den))
    other.den = (other.den / gcd(other.num, other.den))
    puts @den
    puts other.den
    
    if (@den == other.den)
         Racional.new(@num + other.num, @den)
    else
        x = (@den * other.den)
        puts x
        @num = ((x/@den) * @num)
        other.num = ((x / other.num) * other.num)
        #@num = @num + other.num
        puts @num
        @den = x
        Racional.new(@num / gcd(@num,@den), @den/gcd(@num,@den))
    end  
  end
  
  def - (other)
    Racional.new(@num - other.num, @den - other.den)
  end
  
end

obj1 = Racional.new(6,5)
obj2 = Racional.new(8,4)

puts (obj1.*(obj2)).to_s
puts (obj1./(obj2)).to_s

puts obj1.+(obj2)