require "test/unit"
require_relative "../table_indexes_stack"

class Test_push_pop < Test::Unit::TestCase
  def test_stack_method
    stack = TableIndexesStack.new

    stack.push('Fin', 1, 11)
    stack.push('Min', 2, 22)
    stack.push('Lin', 3, 33)

    puts stack.count
    stack.print
    puts "-----------"
    #stack.pop()

    my_stack = stack.get()
    my_stack.each_index do |i|
      puts my_stack[i].index_type
      puts my_stack[i].index_column_name
      puts my_stack[i].index_name
    end

    #stack.reverse()
    #stack.print_rev()

    stack2 = TableIndexesStack.new()
    stack2.push('PRIMARY', '(`id`)', nil )
    expected = stack2.get()
    assert_equal expected[0].index_type, 'PRIMARY'
    assert_equal expected[0].index_column_name, '(`id`)'
    assert_equal expected[0].index_name, nil
  end
end