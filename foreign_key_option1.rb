class ForeignKeyOption1
  @@foreign_options1 = Hash["RESTRICT" => "RESTRICT", "CASCADE" => "CASCADE",
                           "SET" => "SET NULL", "NO" => "NO ACTION"]
  attr_reader :option_value
  def initialize()
    puts 'In ForeignKeyOption1 class'
    @option_value = nil
  end

  def validate_option(token, number_of_passes)
    case token
      when /^[a-zA-Z]*$/
        if @@foreign_options1.has_key?(token)
          case token
            when "RESTRICT"
              if number_of_passes == 1
                return_value = "Go_To_FOREIGN_COLUMN_Transition"
              elsif number_of_passes == 2
                return_value = true
              end
            when "CASCADE"
              if number_of_passes == 1
                return_value = "Go_To_FOREIGN_COLUMN_Transition"
              elsif number_of_passes == 2
                return_value = true
              end
            else
              return_value = true
          end
          @option_value = token
        else
          puts 'Error, In ForeignKeyOption1 class'
          return_value = token
        end

      else
        puts 'Error, In ForeignKeyOption1 class'
        return_value = token
    end
    return return_value
  end

  def get_option()
    return @option_value
  end
end
