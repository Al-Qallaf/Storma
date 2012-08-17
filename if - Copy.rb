#CREATE DATABASE  IF NOT EXISTS `simpledb` /*!40100 DEFAULT CHARACTER SET utf8 */;
#DROP   TABLE     IF EXISTS customers;

class If
	@@theindex = 0
	
	def initialize(tokens, index)
		puts 'if class'
		@@theindex = index + 1
		case tokens[@@theindex]
			when "IF"
				puts 'If token'
				@@theindex = @@theindex + 1
				case tokens[@@theindex]
					when "NOT"
						puts 'Not token'
						@@theindex = @@theindex + 1
						exists_token(tokens)
					when "EXISTS"
						exists_token(tokens)
					else
						puts 'Error 3, NOT or EXISTS is expected'
				end
			else
				puts 'Error 2, IF expected'
		end
	end
	
	def exists_token(tokens)
		if (tokens[@@theindex] == 'EXISTS')						
			puts "Exists token"
			puts tokens[@@theindex]
			theName(tokens)
		else
			puts 'Error 4, EXISTS expected'
		end
	end
	
	def theName(tokens)
		@@theindex = @@theindex + 1
		before = @@theindex - 2
		if tokens[before].match('NOT')
			if /^`[a-zA-Z]*`$/.match(tokens[@@theindex])
				puts tokens[@@theindex]
			else
				puts 'Error 5, not valid name Database name'
			end
		else
			if /^[a-zA-Z]*;$/.match(tokens[@@theindex])
				puts tokens[@@theindex]
			else
				puts 'Error 5, not valid table name'
		end
		end
	end
end