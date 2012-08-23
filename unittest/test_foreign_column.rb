require "test/unit"
require_relative "../foreign_column"

class Test_Foreign_column < Test::Unit::TestCase
  def test_foreign_column_name()
    name_validation = ForeignColumn.new()

    expected = name_validation.column_name("(`customer`)")
    assert_equal expected, true
  end

  def test_foreign_column_name_nil()
    name_validation = ForeignColumn.new()

    expected = name_validation.column_name(nil)
    assert_equal expected, nil
  end


  def test_foreign_column_wrong_name()
    name_validation = ForeignColumn.new()

    expected = name_validation.column_name("name")
    assert_equal expected, "name"
  end
end