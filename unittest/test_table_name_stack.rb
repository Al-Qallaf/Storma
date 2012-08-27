require "test/unit"
require_relative "../table_name_stack"

class MyTest < Test::Unit::TestCase
  def test_table_name_stack()
    stack = TableName_Stack.new()

    stack.push("orders")
    stack.push("customers")

    my_stack = stack.get()
    my_stack.each_index do |i|
      puts my_stack[i].tableName
    end

    stack2 = TableName_Stack.new()
    stack2.push("orders")
    expected = stack2.get()
    assert_equal expected[0].tableName, 'orders'
  end
end