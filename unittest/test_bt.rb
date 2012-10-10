require 'test/unit'
require_relative '../bt'

class TestList < Test::Unit::TestCase

	def test_insert_into_the_tree
		tree = BinaryTree.new()
		tree.add("START",30)
		tree.add("DROP",20)
		tree.add("TABLE",15)
		tree.add("CREATE",40)
		tree.add("DATABASE",36)
		tree.add("TABLE",45)

    current_node = tree.root_node
    assert_equal( current_node.data, "START")
    assert_equal( current_node.right_node.data, "CREATE")
    assert_equal( current_node.left_node.data, "DROP")
    assert_equal( current_node.right_node.right_node.data, "TABLE")
    assert_equal( current_node.right_node.left_node.data, "DATABASE")
    assert_equal( current_node.left_node.left_node.data, "TABLE")
    assert_equal( current_node.left_node.right_node, nil)
  end

	def test_print_method_output
    tree = BinaryTree.new()
    tree.printorder()
  end

  def test_find_value
    tree = BinaryTree.new()
    tree.add("START",30)
    tree.add("DROP",20)
    tree.add("CREATE",40)

		current_node = tree.find_value(30)
    assert_equal(current_node.value, 30)
    assert_equal(current_node.data,"START")
  end

  def test_find_data
    tree = BinaryTree.new()
    tree.add("START",30)
    tree.add("DROP",20)
    tree.add("CREATE",40)

		current_node = tree.find_data('CREATE')
    assert_equal(40, current_node.value)
    assert_equal("CREATE", current_node.data)
  end

  def test_failure
    tree = BinaryTree.new()
    tree.add("START",30)
    tree.add("DROP",20)
    tree.add("CREATE",40)

    current_node = tree.find_value(40)
    assert_equal(current_node.value, 50,"Find does not work correctly")
  end
end
