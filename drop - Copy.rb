#require_relative 'if'

class Drop
	@@theindex = 0
	
	def initialize(tokens, index)
		puts 'Drop class'
		@@theindex = index + 1
		case tokens[@@theindex]
			when "TABLE"
				puts 'Table'
				ifclass = If.new(tokens, @@theindex)
			else
				puts "Error 1, table token expected"
		end
	end

end