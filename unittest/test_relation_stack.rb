require "test/unit"
require_relative "../relation_stack"

class Test_RelationStack < Test::Unit::TestCase
  def test_relation_stack()
    stack = Relation_Stack.new()

    stack.push("tablename1","ref_table1")
    stack.push("tablename2","ref_table2")
    stack.push("tablename3","ref_table3")

    puts stack.count
    stack.print
    puts "-----------"
    val = stack.pop()
    puts "The poped value is : #{val.tableName}"

    mystack = stack.get()
    mystack.each_index do |i|
      puts mystack[i].tableName
      puts mystack[i].referencedTable
    end

    #stack.reverse()
    #stack.print_rev()

    stack2 = Relation_Stack.new()
    stack2.push("tablename3","ref_table3")
    expected = stack2.get()
    assert_equal expected[0].tableName, 'tablename3'
    assert_equal expected[0].referencedTable, 'ref_table3'
  end
end