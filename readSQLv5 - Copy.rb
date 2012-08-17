require_relative 'readio'
require_relative 'create'
require_relative 'column'
require_relative 'tableConstrain'
require_relative 'drop'
require_relative 'bt'
 
class Sql_parser
	
	def parse()
		bufferTokens = Readio.new()
		tokens = bufferTokens.readthefile()
		transitions()
		
		tokens.each_index do |i|
			#puts i
			case tokens[i]
				when "CREATE"
					transition = $transitions.find(0)
					if transition.data == "CREATE"
						cr = Create.new(tokens, i)
					end
				when "DROP"
					dr = Drop.new(tokens, i)
				else
					puts 'Error 0'	
			end
		end
		$transitions.printorder()
	end
	
	def transitions
		$transitions = BinaryTree.new("CREATE",0)
		$transitions.add("TABLE",1)
		$transitions.add("TABLE_NAME",2)
		$transitions.add("(",3)
		$transitions.add("COLUMN_NAME",4)
		$transitions.add("COLUMN_TYPE",5)
		$transitions.add("COLUMN_CONSTRAINTS",6)
		$transitions.add("TABLE_CONSTRAINTS",7)
		$transitions.add(");",8)
		
	end
end


ReadSqlFile= Sql_parser.new()
ReadSqlFile.parse()