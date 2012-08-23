require "test/unit"
require_relative "../foreign_table"

class Test_Foreign_Table < Test::Unit::TestCase
  def test_foreign_table_name()
    name_validation = ForeignTable.new()

    expected = name_validation.table_name("`customer`")
    assert_equal expected, true
  end

  def test_foreign_table_name_nil()
    name_validation = ForeignTable.new()

    expected = name_validation.table_name(nil)
    assert_equal expected, nil
  end


  def test_foreign_table_wrong_name()
    name_validation = ForeignTable.new()

    expected = name_validation.table_name("name")
    assert_equal expected, "name"
  end
end