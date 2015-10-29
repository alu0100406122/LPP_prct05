require './lib/racional.rb'
require 'test/unit'

class TestRacional < Test::Unit::TestCase

  def setup
    @origen = Racional.new(3,1)
    @unidad = Racional.new(1,1)
  end

  def test_simple
    #assert_equal("(-1/-1)", (-@unidad).to_s)
    assert_equal("(4/1)", (@origen + @unidad).to_s)
    assert_equal("(3/1)", (@origen * @unidad).to_s)
    assert_equal("(3/1)", (@origen / @unidad).to_s)
    assert_equal("(2/1)", (@origen - @unidad).to_s)
    
    assert_not_equal("(2/1)", (@origen + @unidad).to_s)
    assert_not_equal("(9/5)", (@origen / @unidad).to_s)
    assert_not_equal("(1/3)", (@origen * @unidad).to_s)
    assert_not_equal("(5/3)", (@origen - @unidad).to_s)
  end

end