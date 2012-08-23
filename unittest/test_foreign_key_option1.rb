require "test/unit"
require_relative "../foreign_key_option1"

class Test_foreign_key_option1 < Test::Unit::TestCase
  def test_foreign_key_option1_transition
    name = ForeignKeyOption1.new()
    expected = name.validate_option("RESTRICT",1)
    assert_equal expected, "Go_To_FOREIGN_COLUMN_Transition" #because next we expecting "ON" token

    expected = name.validate_option("CASCADE",1)
    assert_equal expected, "Go_To_FOREIGN_COLUMN_Transition"

    expected = name.validate_option("RESTRICT",2)
    assert_equal expected, true

    expected = name.validate_option("CASCADE",2)
    assert_equal expected, true
  end

  def test_nil
    name = ForeignKeyOption1.new()
    expected = name.validate_option(nil,1)
    assert_equal(expected, nil, "Return value should be nil, here test nil")

    expected = name.validate_option(nil,2)
    assert_equal(expected, nil, "Return value should be nil, here test nil")
  end


  # Fake test
  def test_fail
    name = ForeignKeyOption1.new()
    expected = name.validate_option("word",1)
    assert_equal(expected, "word", "Return value should be same token")

    expected = name.validate_option("word",2)
    assert_equal(expected, "word", "Return value should be same token")
  end
end