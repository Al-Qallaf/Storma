require_relative 'if'

class Create
	@@theindex = 0
	
	def initialize(tokens, index)
		puts 'Create class'
		@@theindex = index + 1
		case tokens[@@theindex]
			when "TABLE"
				transition = $transitions.find(1)
				if transition.data == "TABLE"
					puts 'Table'
					table(tokens)
					open_statement(tokens)
				end
			when "DATABASE"
				database(tokens)
			else
				puts "Error 1, table or database token expected"
		end
	end
	
	def table(tokens)
		@@theindex = @@theindex + 1
		transition = $transitions.find(2)						
		if /[a-zA-Z]/.match(tokens[@@theindex])
			transition.data = tokens[@@theindex]
			puts "Table name is variable of letters only" 
			puts tokens[@@theindex]
		else
			puts 'Error 2'
		end
	end
	
	def open_statement(tokens)
		@@theindex = @@theindex + 1
		transition = $transitions.find(3)
		if tokens[@@theindex] == "(" and transition.data == "("
			puts tokens[@@theindex]
			co = Column.new(tokens, @@theindex)
		else
			puts 'Error 3, no open statment Bracets'
		end
	end
	
	def database(tokens)
		puts 'Database token'
		ifclass = If.new(tokens, @@theindex)
	end

end