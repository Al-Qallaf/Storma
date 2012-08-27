class ForeignKeyOption2
  @@foreign_options2 = Hash["NULL" => "SET NULL", "ACTION" => "NO ACTION"]
  attr_reader :option_value

  def initialize()
    puts 'In ForeignKeyOption2 class'
    @option_value = nil
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

  def get_option(token)
    if @@foreign_options2.has_key?(token)
      @option_value = @@foreign_options2[token]
    end

    return @option_value
  end
end