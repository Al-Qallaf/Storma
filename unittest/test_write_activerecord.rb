require "test/unit"
require_relative "../write_activerecord"
require_relative "../table_indexes_stack"

class TestWriteActiverecord < Test::Unit::TestCase
  def test_active_record_script()
    write = Write_ActiveRecord.new()

    tableIndexes = TableIndexesStack.new()
    tableIndexes.push("PRIMARY", "idorders", nil)
    tableIndexes.push("KEY", "customerid", "F_K_IN_ord_to_cus")

    write.write_active_record_script("hello","TheForeignKey_name","AnotherTableClass","AnotherTableColumn",tableIndexes)

  end
end