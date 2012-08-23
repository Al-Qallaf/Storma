class ForeignKeyColumnName
  def initialize()
    puts 'In ForeignKeyColumnName class'
  end

  def foreignColumnNameCheck(token)
    case token
      when /^\(`[a-zA-Z]\w*`\)$/
        return_value = true

      else
        puts "Error in 'Foreign_Column_Name' class, Foreign Column Name is invalid"
        return_value = token
    end
    return return_value
  end
end