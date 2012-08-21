class Key
  def initialize()
    puts "In Key Class"
  end

  def validate(token)
    case token
      when "KEY"
        return_value = true

      when /^`[a-zA-Z]\w*?`$/
        return_value = true

      else
        puts "Error, In Key Class"
        return_value = token
    end
    return return_value
  end
end