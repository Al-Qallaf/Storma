class Foreign
  def initialize()
    puts "In Foreign Class"
  end

  def validate(token)
    case token
      when "FOREIGN"
        return_value = true

      else
        puts "Error, In Foreign Class"
        return_value = token
    end
    return return_value
  end
end