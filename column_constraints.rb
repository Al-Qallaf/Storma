class Column_Constraints
  $times_in = 0

	def initialize()
		puts 'In Column_Constraints class'
    #columnConstraintsCheck(token)
  end

  def columnConstraintsCheck(token)
    constraints_variables = Hash["NOT" => 1, "NULL" => 2, "DEFAULT" => 3]
    case token
      when /^[a-zA-Z]*,$/
          puts "column Constraint with ,"
          puts 'Make split here then seek the key in The Constraint_Variables'
          theType = token.split(',')
          if constraints_variables.has_key?(theType[0])
            theKey = theType[0]
            theVal = constraints_variables[theKey]
            puts "The Constraint is : #{theVal}"
            #$column_definition_type = theVal
            return true
            #return "Go_To_bracket_Transition"
          else
            $times_in = 0
            return token
          end

      when /^'[a-zA-Z]*|\d*',$/ #handel ex. "'1',"  or "'new',"
          puts "column Constraint with '',"
          puts 'Make split here then seek the key in The Constraint_Variables'
          puts "The Constraint is : #{token}"
          return true

      when /^[a-zA-Z]*[a-zA-Z]*[a-zA-Z]*$/i
          puts 'column Constraint is letters only'
          if constraints_variables.has_key?(token)
            theKey = token
            theVal = constraints_variables[theKey]
            puts "The Constraint is : #{theVal}"
            #$column_definition_type = theVal
            return "Go_To_Col_type_Transition"
          else
            $times_in = 0
            return token
          end

      #when ");"
      #    return "Go_TO_END"

      #when "PRIMARY"
      #    return "Go_to_Table_Constraints"

      else
          puts 'Error, column Constraint is not valid.'
          $times_in = 0
          return token
      end
  end

  def in_class_times_increase()
    $times_in = $times_in + 1
  end

  def in_class_times()
    return $times_in
  end

end