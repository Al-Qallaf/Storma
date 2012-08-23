class References
  def initialize()
    puts "In References Class"
  end

  def validate(token)
    case token
      when "REFERENCE"
        return_value = true

      else
        puts "Error, In References Class"
        return_value = token
    end
    return return_value
  end
end