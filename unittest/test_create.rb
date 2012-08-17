require 'test/unit'
require_relative '/Ruby193/withoutrails/ReadSQLfileV5/create'
require_relative '/Ruby193/withoutrails/ReadSQLfileV5/bt'

class TestCreate < Test::Unit::TestCase
	def test_mymethod
		transitions()
		tokens = ["TABLE", "TableName", "l"]
		cr = Create.new(tokens,-1)
	end
	
	
	def test_themethod
		puts '--------------------'
		tokens = ["DATABASE"]
		cr = Create.new(tokens,-1)
		# expected = cr.mymethod 4
		# assert_equal expected, 4
	end
	
	def transitions
		$transitions = BinaryTree.new("CREATE",0)
		$transitions.add("TABLE",1)
		$transitions.add("TableName",2)
		$transitions.add("(",3)
		$transitions.add("COLUMN_NAME",4)
		$transitions.add("COLUMN_TYPE",5)
		$transitions.add("COLUMN_CONSTRAINTS",6)
		$transitions.add("TABLE_CONSTRAINTS",7)
		$transitions.add(");",8)	
	end
end