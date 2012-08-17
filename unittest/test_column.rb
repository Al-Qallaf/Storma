require 'test/unit'
require_relative '/Ruby193/withoutrails/ReadSQLfileV5/column'
require_relative '/Ruby193/withoutrails/ReadSQLfileV5/bt'

class TestColumn < Test::Unit::TestCase
	def test_mymethod
		transitions()
		tokens = ["id", "int(11)", "NOT", "NULL,",");"]
		cr = Column.new(tokens,-1)
		#expected = cr.mymethod 7
		#assert_equal expected, 4
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