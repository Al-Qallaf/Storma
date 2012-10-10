
class Bracket
	def initialize(token)
		puts 'In Bracket class'
		bracket(token)
	end

	def bracket(token)
		case token
			when "("
				puts 'Open bracket'
			when ")"
				puts 'Close bracket'
			else
				puts 'Error 4, no open/close Bracket'
		end
	end	
	
	# def open_statement(tokens)
		# @@theindex = @@theindex + 1
		# transition = $transitions.find(3)
		# if tokens[@@theindex] == "(" and transition.data == "("
			# puts tokens[@@theindex]
			# co = Column.new(tokens, @@theindex)
		# else
			# puts 'Error 3, no open statment Bracets'
		# end
	# end
end