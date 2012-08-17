require "test/unit"
require_relative "../write_migration"
require_relative "../column_stack"

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
    wf.write_migration_script("orders", column_definition)
  end
end

