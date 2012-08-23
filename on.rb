class On
  def initialize()
    puts "In On Class"
  end

  def validate(token)
    case token
      when "ON"
        return_value = true

      else
        puts "Error, In On Class"
        return_value = token
    end

    return return_value
  end
end