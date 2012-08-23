require "test/unit"
require "../on"

class Test_On < Test::Unit::TestCase
  def test_on_transition()
    name = On.new()

    expected = name.validate("ON")
    assert_equal expected, true, "Return value  should be true"
  end

  def test_nil()
    name = On.new()

    expected = name.validate(nil)
    assert_equal(expected, nil, "Return value should be nil, here test nil")
  end

  def test_wrong_token()
    name = On.new()

    expected = name.validate("word")
    assert_equal(expected, "word", "Return value should be same token")
  end
end