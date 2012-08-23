class ForeignTable
  def initialize()
    puts "In foreign_table class"
  end

  def table_name(token)
    case token
      when /^`[a-zA-Z]\w*?`$/
        return_value = true
      else
        puts "Error in 'table_name' class, table name is invalid"
        return_value = token
    end
    return return_value

  end
end