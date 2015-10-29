
require './lib/gcd.rb'

class Racional
  
  attr_accessor :num, :den
  
  def initialize(num, den)
    @num, @den = num, den
  end
  
  def to_s
    "(#{@num}/#{@den})"
  end
  
  def escalar(value)
    Racional.new(@num * value, @den)
  end
  
  def * (other)
    x = gcd(@num * other.num, @den * other.den)
    Racional.new((@num*other.num)/x, (@den*other.den)/x)
  end
  
  def / (other)
    x = gcd(@num * other.den, @den * other.num)
    Racional.new(@num * other.den, @den * other.num)
  end
  
  def + (other)
    
    if (@den == other.den)
        num_ = @num + other.num
        den_ = @den
        y = gcd(num_, den_)
    else
        x = (@den * other.den)
        num_ = (@num * (x/@den))
        other.num = (other.num * (x/other.den))
        num_ = num_ + other.num
        den_ = x
        y = gcd(num_, den_)
    end
    Racional.new(num_ / y, den_ / y)
  end
  
  def - (other)
    
    if (@den == other.den)
        num_ = @num - other.num
        den_ = @den
        y = gcd(num_, den_)
    else
        x = (@den * other.den)
        num_ = (@num * (x/@den))
        other.num = (other.num * (x/other.den))
        num_ = num_ - other.num
        den_ = x
        y = gcd(num_, den_)
    end
    Racional.new(num_ / y, den_ / y)
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