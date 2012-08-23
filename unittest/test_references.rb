require "test/unit"
require_relative "../references"

class TestReferences < Test::Unit::TestCase
    def test_Reference_transition()
      name = References.new()

      expected = name.validate("REFERENCE")
      assert_equal expected, true
    end

    def test_nil()
      name = References.new()

      expected = name.validate(nil)
      assert_equal(expected, nil, "Return value should be nil, here test nil")
    end

    def test_wrong_token()
      name = References.new()

      expected = name.validate("word")
      assert_equal(expected, "word", "Return value should be same token")
    end
end