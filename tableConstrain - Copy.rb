class TableConstrain
	@@theindex = 0
	
	def initialize(tokens, currentindex)
		@@theindex = currentindex
		case tokens[@@theindex]
			when ");"
				puts 'end of the statement bracets'
				puts tokens[@@theindex]
			when "PRIMARY"
				puts 'table constrain'
				puts tokens[@@theindex]
				@@theindex = @@theindex + 1
				case tokens[@@theindex]
					when "KEY"
						puts 'The Key word'
						puts tokens[@@theindex]
						@@theindex = @@theindex + 1
						if /^\([a-zA-Z]*\)$/.match(tokens[@@theindex])
							puts 'The primary key is'
							puts tokens[@@theindex]
							@@theindex = @@theindex + 1
							case tokens[@@theindex]
								when ");"
									puts 'end of the statement bracets'
									puts tokens[@@theindex]
								else
									puts 'Error 7, end of statement expected'
								end
						else
							puts 'Error 8, not vaild primary key name'
						end				
				end
			else
				puts 'Error 7, end of statement or table constrains expected'
		end
		
	end
end