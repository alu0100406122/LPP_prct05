
require '../lib/gcd.rb'

class Racional
  
  attr_accessor :num, :den, :x, :y, :z
  
  def initialize(num, den)
    @num, @den = num, den
  end
  
  def to_s
    "(#{@num}/#{@den})"
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
    x = gcd(@num, @den)
    y = gcd(other.num, other.den)
    @num = (@num / x)
    @den = (@den / x)
    other.num = (other.num / y)
    other.den = (other.den / y)
    
    if (@den == other.den)
         Racional.new(@num + other.num, @den)
    else
        x = (@den * other.den)
        @num = (@num * (x/@den))
        other.num = (other.num * (x/other.den))
        @num = @num+other.num
        @den = x
        Racional.new(@num/gcd(@num,@den), @den/gcd(@num,@den))
    end  
  end
  
  def - (other)
    x = gcd(@num, @den)
    y = gcd(other.num, other.den)
    @num = (@num / x)
    @den = (@den / x)
    other.num = (other.num / y)
    other.den = (other.den / y)
    
    if (@den == other.den)
         Racional.new(@num - other.num, @den)
    else
      
        x = (@den * other.den)
        @num = (@num * (x/@den))
        other.num = (other.num * (x/other.den))
        @num = @num-other.num
        @den = x
        Racional.new(@num/gcd(@num,@den), @den/gcd(@num,@den))
    end  
  end
  
  
end

#obj1 = Racional.new(6,2)
#obj2 = Racional.new(4,3)

#puts (obj1.*(obj2)).to_s
#puts (obj1./(obj2)).to_s
#puts "Suma"
#puts obj1+(obj2)

#puts "Resta"
#puts obj1-(obj2)