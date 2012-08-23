class ConstraintName
  def initialize()
    puts "In ConstraintName Class"
  end

  def validate(token)
    case token
      when /^`[a-zA-Z]\w*?`$/
        return_value = true

      else
        puts "Error, In constraint_name Class"
        return_value = token
    end

    return return_value
  end
end