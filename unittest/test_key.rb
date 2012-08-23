require "test/unit"
require_relative "../key"

class TestKey < Test::Unit::TestCase
    def test_key_transition()
      name = Key.new()

      expected = name.validate("`name`")
      assert_equal expected, true

      expected = name.validate("KEY")
      assert_equal(expected, true, "Return value should be true")
    end

    def test_nil()
      name = Key.new()

      expected = name.validate(nil)
      assert_equal(expected, nil, "Return value should be true, here test nil")
    end

    def test_wrong_token()
      name = Key.new()

      expected = name.validate("mykey")
      assert_equal(expected, "mykey", "Return value should be true, here test nil")
    end
end