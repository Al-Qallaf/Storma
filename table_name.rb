class TableName
  attr_reader :token

	def initialize()
		puts 'In TableName class'
    @token = nil
	end
	
	def table_name(token)
    case token
      when "CREATE"
        puts "Error in 'table_name' class, table name is reserved word"
        return token
      when /^`[a-zA-Z]\w*?`$/
        @token = token
        return true
      when /^[a-zA-Z]\w*$/
        @token = token
        return true
      else
        puts "Error in 'table_name' class, table name is invalid"
        return token
    end
  end

  def table_name_needed()
    if @token.count('`') == 2
      the_name =  @token.split("`")
      return the_name[1]
    else
      return @token
    end
  end
	
	# def table(tokens)
		# @@theindex = @@theindex + 1
		# transition = $transitions.find(2)						
		# if /[a-zA-Z]/.match(tokens[@@theindex])
			# transition.data = tokens[@@theindex]
			# puts "Table name is variable of letters only" 
			# puts tokens[@@theindex]
		# else
			# puts 'Error 2, table name error'
		# end
	# end
end