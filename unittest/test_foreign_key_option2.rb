require "test/unit"
require_relative "../foreign_key_option2"

class Test_foreign_key_option2 < Test::Unit::TestCase
  def test_foreign_key_option2_transition
    name = ForeignKeyOption2.new()

    expected = name.validate_option("ACTION", 1)
    assert_equal expected, "Go_To_On_Transition"

    expected = name.validate_option("NULL",1)
    assert_equal expected, "Go_To_On_Transition"

    expected = name.validate_option("ACTION",2)
    assert_equal expected, true

    expected = name.validate_option("NULL",2)
    assert_equal expected, true

    expected = name.validate_option("ON",8)
    assert_equal expected, "Go_To_On_Transition"
  end

  def test_nil
    name = ForeignKeyOption2.new()

    expected = name.validate_option(nil, 1)
    assert_equal(expected, nil, "Return value should be nil, here test nil")
  end


  # Fake test
  def test_fail
    name = ForeignKeyOption2.new()

    expected = name.validate_option("word", 1)
    assert_equal(expected, "word", "Return value should be same token")
  end
end