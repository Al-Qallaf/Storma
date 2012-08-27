require "test/unit"
require_relative "../activerecord_relations_files"
require_relative "../relation_stack"

class MyTest < Test::Unit::TestCase
  def test_append_information_to_files()
    stack = Relation_Stack.new()
    stack.push("orders","customers")

    relations = ActiverecordRelationsFiles.new()
    relations.add_to_activerecord_classes(stack)
  end
end