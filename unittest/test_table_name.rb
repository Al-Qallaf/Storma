require "test/unit"
require_relative "../table_name"

class Test_table_name_validation < Test::Unit::TestCase
  def test_the_table_name
    name_validation = TableName.new()

    expected = name_validation.table_name("customer")
    assert_equal expected, true

    expected = name_validation.table_name("`customer`")
    assert_equal expected, true

    expected = name_validation.table_name("orders2")
    assert_equal expected, true

    expected = name_validation.table_name("_ali3") #error
    assert_equal expected, "_ali3"

    expected = name_validation.table_name("2table") #error
    assert_equal expected, "2table"

    expected = name_validation.table_name("CREATE") #error
    assert_equal expected, "CREATE"

    expected = name_validation.table_name("`customer`")
    assert_equal expected, true
    if expected == true
      expected = name_validation.table_name_needed()
      assert_equal expected, "customer"
    end

    expected = name_validation.table_name("customer")
    assert_equal expected, true
    if expected == true
      expected = name_validation.table_name_needed()
      assert_equal expected, "customer"
    end

  end
end