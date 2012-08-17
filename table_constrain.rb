class TableConstrain

  @@constrains_Table = Hash["PRIMARY" => 1, "KEY" => 2]

  def initialize()
		puts 'In TableConstrain class'
  end

  def table_constrains_check(token)
    case token
      when /^`[a-zA-Z]*`$/
        puts "Go_To_bracket_Transition"
        return_value = "Go_To_bracket_Transition"

      when /^[a-zA-Z]*$/
        if @@constrains_Table.has_key?(token)
          puts "Go_To_Column_Constrain_Transition"
          return_value = "Go_To_Column_Constrain_Transition"
        else
          puts "Go_To_bracket_Transition"
          return_value = "Go_To_bracket_Transition"
        end

      when /^\(`[a-zA-Z]*`\)$/
        #validate here if we have column name has same this primary key name
        puts "Primary key name is : #{token}"
        return_value = true

      when /^\([a-zA-Z]*\)$/
        #validate here if we have column name has same this primary key name
        puts "Primary key name is : #{token}"
        return_value = true


      #when "PRIMARY"
      #  puts 'PRIMARY key is here'
      #  return_value = "Go_To_Column_Constrain_Transition"
        #return_value = true # we need to do something here for to handle table constrains maybe going back to col-cons

      else
        puts 'Error, In table_constrain class'
        #maybe return token ?
    end

    return return_value
  end
end
	#@@theindex = 0
	
	# def initialize(tokens, currentindex)
		# @@theindex = currentindex
		# case tokens[@@theindex]
			# when ");"
				# puts 'end of the statement bracets'
				# puts tokens[@@theindex]
			# when "PRIMARY"
				# puts 'table constrain'
				# puts tokens[@@theindex]
				# @@theindex = @@theindex + 1
				# case tokens[@@theindex]
					# when "KEY"
						# puts 'The Key word'
						# puts tokens[@@theindex]
						# @@theindex = @@theindex + 1
						# if /^\([a-zA-Z]*\)$/.match(tokens[@@theindex])
							# puts 'The primary key is'
							# puts tokens[@@theindex]
							# @@theindex = @@theindex + 1
							# case tokens[@@theindex]
								# when ");"
									# puts 'end of the statement bracets'
									# puts tokens[@@theindex]
								# else
									# puts 'Error 7, end of statement expected'
								# end
						# else
							# puts 'Error 8, not vaild primary key name'
						# end				
				# end
			# else
				# puts 'Error 7, end of statement or table constrains expected'
		# end
		
	# end
#end