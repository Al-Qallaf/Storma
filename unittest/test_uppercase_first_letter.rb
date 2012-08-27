require "test/unit"
require_relative "../uppercase_first_letter"

class TestWriteActiverecord < Test::Unit::TestCase
  def test_UppercaseFirstLetter_script()
    cap = UppercaseFirstLetter.new()
    new_table_name =cap.uppercase_first_letter("hello")
    assert_equal new_table_name, "Hello"

    new_table_name =cap.uppercase_first_letter("Hello")
    assert_equal new_table_name, "Hello"
  end

  def test_fail()
    cap = UppercaseFirstLetter.new()
    new_table_name =cap.uppercase_first_letter("hello")
    assert_equal new_table_name, "hello"
  end
end