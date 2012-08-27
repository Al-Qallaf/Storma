class IndexNameOrIndexColumnName
  def initialize()
    puts "In class IndexNameOrIndexColumnName"
  end

  def validate(token)
    case token
      when /^\(`[a-zA-Z]\w*?`\),$/    #index_column_name ex. (`ali`),
        return_value = true

      when /^\(`[a-zA-Z]\w*?`\)$/    #index_column_name ex. (`ali`)
        return_value = true

      when /^`[a-zA-Z]\w*?`$/        #index_name ex. `ali`
        return_value = "Go_To_KEY_Transition"

      else
        puts "Error, In IndexNameOrIndexColumnName Class"
        return_value = token
    end

    return return_value
  end
end