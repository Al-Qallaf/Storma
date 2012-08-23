require "test/unit"
require_relative "../foreign_key_column_name"

class Test_foreign_column_name < Test::Unit::TestCase
  def test_valid_name
    name = ForeignKeyColumnName.new()

    result = name.foreignKeyColumnNameCheck("(`theName`)")
    assert_equal(result, true, "Return value should be comply with regx ")

  end

  def test_wrong_name
    name = ForeignKeyColumnName.new()

    result = name.foreignKeyColumnNameCheck("theName")
    assert_equal(result, "theName", "Return value should be same token")
  end
end