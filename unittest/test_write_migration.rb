require "test/unit"
require_relative "../write_migration"
require_relative "../column_stack"
require_relative "../table_indexes_stack"

class Test_write_migration < Test::Unit::TestCase
  def test_read()
    rf = Write_Migration.new()
    rf.read_file()
  end

  def test_write()
    wf = Write_Migration.new()
    column_definition = Column_Stack.new()
    column_definition.push("id", "integer", ["NOT", "NULL", "DEFAULT", "'50',"])
    column_definition.push("name", "string", ["DEFAULT", "NULL,"])

    tableIndexes = TableIndexesStack.new()
    tableIndexes.push("KEY", "idorders", nil)
    tableIndexes.push("KEY", "customerid", "F_K_IN_ord_to_cus")

    wf.write_migration_script("oky", column_definition, tableIndexes)
  end
end

