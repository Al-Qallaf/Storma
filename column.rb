class Column
	@@theindex = 0
	# @@typeTable = Hash["VARCHAR" => ":string", "TEXT" => ":text", "INT" => ":integer", "FLOAT"=> ":float",
		 # "DECIMAL" => ":decimal","DATETIME" => ":datetime", "TIMESTAMP" => ":timestamp",
		 # "TIME" => ":time", "DATE" => ":date", "BINARY" => ":binary", "TINYINT" => ":boolean"]
	
	@@typeTable = Hash["varchar" => ":string", "text" => ":text", "int" => ":integer", "float"=> ":float",
						"decimal" => ":decimal","datetime" => ":datetime", "timestamp" => ":timestamp",
						"time" => ":time", "date" => ":date", "binary" => ":binary", "tinyint" => ":boolean"]	
	
	def initialize(tokens, currentindex)
		@@theindex = currentindex
		columnDefinition(tokens)
		tableConstrain(tokens)
	end
	
	
	def columnDefinition(tokens)
		@@theindex = @@theindex + 1
		#while (tokens[@@theindex] != "PRIMARY") or (tokens[@@theindex] != ");") do
		flag = true
		if (tokens[@@theindex] == "PRIMARY")
			flag = false
			puts 'Error, not vaild syntax'
		end
		if (tokens[@@theindex] == ");")
			flag = false
			puts 'Error, not vaild syntax'
		end
		
		while flag do
			if /^`[a-zA-Z]*`$/.match(tokens[@@theindex]) or /^[a-zA-Z]*$/.match(tokens[@@theindex])
				transition = $transitions.find(4)
				transition.data = tokens[@@theindex]
				puts 'column name'
				puts tokens[@@theindex]
				@@theindex = @@theindex + 1
			else
				puts 'Error 4, column name not valid'
				break
			end
			
			if columnType(tokens) == false
				break
			end
			
			case tokens[@@theindex] 
				when "NOT"
					puts 'column constrain 1'
					puts tokens[@@theindex]
					@@theindex = @@theindex + 1
					case tokens[@@theindex]
						when "NULL,"
							puts 'column constrain 2'
							puts tokens[@@theindex]
					end
				when "DEFAULT"
					puts 'column constrain 1'
					puts tokens[@@theindex]
					@@theindex = @@theindex + 1
					case tokens[@@theindex]
						when "NULL,"
							puts 'column constrain 2'
							puts tokens[@@theindex]
					end
				else
					puts 'Error 6, column constrain not valid'
					break
			end
			@@theindex = @@theindex + 1
			
			if (tokens[@@theindex] == "PRIMARY")
				flag = false
			end
			if (tokens[@@theindex] == ");")
				flag = false
			end
		end
		
	end
	
	def tableConstrain(tokens)
		tcons = IndexType.new(tokens, @@theindex)
	end
	
	def columnName()
		puts 'columnName'
	end
	
	def columnType(tokens)
		case tokens[@@theindex]
			when /^[a-zA-Z]*\(\d+\)$/
				puts 'column Type with bractes'
				puts 'Make split here then seek the key in typetable'
				theType = tokens[@@theindex].split('(')
				puts 
				if @@typeTable.has_key?(theType[0])
					theKey = theType[0]
					puts theKey
					puts  "-------------- Available key in the typeTable 1"
					theVal = @@typeTable[theKey]
					puts "The Value #{theVal}"
					transition = $transitions.find(5)
					transition.data = theVal
					@@theindex = @@theindex + 1
					return true
				else
					return false
				end
			
			when /^[a-zA-Z]*[a-zA-Z]*[a-zA-Z]*$/i
				puts 'column Type latters only'
				if @@typeTable.has_key?(tokens[@@theindex])
					theKey = tokens[@@theindex]
					puts theKey
					puts  "-------------- Available key in the typeTable 2"
					theVal = @@typeTable[theKey]
					puts "The Value #{theVal}"
					transition = $transitions.find(5)
					transition.data = theVal
					@@theindex = @@theindex + 1
					return true
				end
				
			else
				puts 'Error 5, column type not valid'
				return false
		end		
	end
	
	def columnConstrain()
		puts 'columnConstrain'
	end
	
end