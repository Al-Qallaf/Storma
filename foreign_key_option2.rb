class ForeignKeyOption2
  @@foreign_options = Hash["NULL" => "SET NULL", "ACTION" => "NO ACTION"]

  def initialize()
    puts 'In ForeignKeyOption2 class'
  end

  def validate_option(token, number_of_passes)
    case token
      when "ON"
        return_value = "Go_To_FOREIGN_COLUMN_Transition"

      when "NULL"
        if number_of_passes == 1
          return_value = "Go_To_FOREIGN_COLUMN_Transition"
        elsif number_of_passes == 2
          return_value = true
        end

      when "ACTION"
        if number_of_passes == 1
          return_value = "Go_To_FOREIGN_COLUMN_Transition"
        elsif number_of_passes == 2
          return_value = true
        end

      else
        puts 'Error, In ForeignKeyOption2 class'
        return_value = token
    end

    return return_value
  end
end