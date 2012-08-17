class Column_Name
  attr_reader :token

  def initialize()
		puts 'In Column_Name class'
    @token = nil
  end

  def columnNameCheck(token)
    case token
      when /^`[a-zA-Z]\w*?`$/
        @token=token
        return true

      when /^[a-zA-Z]\w*$/
        @token=token
        return true

      else
        puts "Error in 'Column_Name' class, column name is invalid"
        return token
    end
  end

  def column_name_needed()
    if @token.count('`') == 2
      the_name =  @token.split("`")
      return the_name[1]
    else
      return @token
    end
  end
end