require "test/unit"
require_relative "../close_activerecord_file"
require_relative "../table_name_stack"

class MyTest < Test::Unit::TestCase
  def test_append_information_to_files()
    stack = TableName_Stack.new() #make new stack for table names only
    stack.push("orders")
    stack.push("customers")

    close = CloseActiveRecordFile.new()
    close.all_active_record_files(stack)
  end
end