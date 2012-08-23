class ForeignColumn
  def initialize()
    puts "In foreign_column class"
  end

  def column_name(token)
    case token
      when /^\(`[a-zA-Z]\w*`\)$/
        return_value = true
      else
        puts "Error in 'foreign_column' class, table name is invalid"
        return_value = token
    end
    return return_value

  end
end