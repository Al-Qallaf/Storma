class Constraint
  def initialize()
    @indexes_table = Hash["PRIMARY" => 1, "KEY" => 2, "UNIQUE" => 3]
    puts "In Constraint Class"
  end

  def validate(token)
    case token
      when "CONSTRAINT"
        return_value = true

      when /^[a-zA-Z]*$/
        if @indexes_table.has_key?(token)
          return_value = "Go_To_COLUMN_CONSTRAINT"
        else
          return_value = token
        end

      else
        puts "Error, In Key Class"
        return_value = token
    end

    return return_value
  end
end