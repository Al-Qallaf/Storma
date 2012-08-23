require "test/unit"
require_relative "../foreign"

class Test_foreign_transition < Test::Unit::TestCase
  def test_foreign_transition()
    name = Foreign.new()

    expected = name.validate("FOREIGN")
    assert_equal expected, true
  end

  def test_nil()
    name = Foreign.new()

    expected = name.validate(nil)
    assert_equal(expected, nil, "Return value should be nil, here test nil")
  end

  def test_wrong_token()
    name = Foreign.new()

    expected = name.validate("word")
    assert_equal(expected, "word", "Return value should be same token")
  end
end