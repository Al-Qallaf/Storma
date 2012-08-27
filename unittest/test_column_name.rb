require "test/unit"
require_relative "../column_name"

class Test_column_name_validity < Test::Unit::TestCase
  def test_name()
    name_check = Column_Name.new()

    expected = name_check.columnNameCheck("`name`")
    assert_equal expected, true
    if expected == true
      result = name_check.column_name_needed()
      assert_equal(result,"name")
    end

    expected = name_check.columnNameCheck("address")
    assert_equal expected, true
    if expected == true
      result = name_check.column_name_needed()
      assert_equal(result,"address")
    end

    expected = name_check.columnNameCheck("id432_")
    assert_equal expected, true
    if expected == true
      result = name_check.column_name_needed()
      assert_equal(result,"id432_")
    end
  end

  def test_fail
    name_check = Column_Name.new
    expected = name_check.columnNameCheck("4add")
    assert_equal expected, "4add", "The name should not start with number"
  end

end