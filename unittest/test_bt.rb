require 'test/unit'
require_relative '/Ruby193/withoutrails/ReadSQLfileV5/bt'

class TestList < Test::Unit::TestCase

#   10
# 8    15
#6   11  17


	def test_add
		tree = BinaryTree.new()
		tree.add("d1",1)
		tree.add("d2",2)
		tree.add("d3",3)
		tree.add("d4",4)
		tree.add("d5",5)
		tree.add("d6",6)
		tree.add("d7",7)
		
		tree.printorder()
		
		thenode = tree.find_value(9)
		puts thenode.value
		puts thenode.data

		thenode = tree.find_data('d6')
		puts thenode.value
		puts thenode.data
	end
end