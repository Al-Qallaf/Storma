class IndexType

  @@indexes_Table = Hash["PRIMARY" => 1, "KEY" => 2, "UNIQUE" => 3]

  def initialize()
		puts 'In IndexType class'
  end

  def index_type_check(token)
    case token
      #when /^`[a-zA-Z]*`$/
      when /^`[a-zA-Z]\w*?`$/
        puts "Go_To_bracket_Transition"
        return_value = "Go_To_bracket_Transition"

      #when /^[a-zA-Z]*$/
      when /^[a-zA-Z]\w*$/
        if @@indexes_Table.has_key?(token)
          return_value = true  # continue to next transition
        else
          puts "Go_To_bracket_Transition"
          return_value = "Go_To_bracket_Transition"
        end

      #when /^\(`[a-zA-Z]*`\)$/
      when /^\(`[a-zA-Z]\w*`\)$/
        #validate here if we have column name has same this primary key name
        puts "Primary key name is : #{token}"
        return_value = true

      #when /^\([a-zA-Z]*\)$/
      when /^\([a-zA-Z]\w*\)$/
        #validate here if we have column name has same this primary key name
        puts "Primary key name is : #{token}"
        return_value = true

      else
        puts 'Error, In index_type class'
        return_value = token
    end

    return return_value
  end
end