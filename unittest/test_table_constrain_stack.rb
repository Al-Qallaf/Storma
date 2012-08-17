require "test/unit"
require_relative "../table_constrain_stack"

class Test_push_pop < Test::Unit::TestCase
  def test_stack_method
    stack = TableConstrainStack.new

    stack.push('Fin', 1)
    stack.push('Min', 2)
    stack.push('Lin', 3)

    puts stack.count
    stack.print
    puts "-----------"
    #stack.pop()

    my_stack = stack.get()
    my_stack.each_index do |i|
      puts my_stack[i].constrain
      puts my_stack[i].constrainName
    end

    #stack.reverse()
    #stack.print_rev()

    stack2 = TableConstrainStack.new()
    stack2.push('id', 'int')
    expected = stack2.get()
    assert_equal expected[0].constrain, 'id'
    assert_equal expected[0].constrainName, 'int'
  end
end