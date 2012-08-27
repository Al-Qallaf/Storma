require "test/unit"
require_relative 'create'
require_relative 'table'
require_relative 'bracket'
require_relative 'table_name'
require_relative 'column_name'
require_relative 'column_type'
require_relative 'column_constraints'
require_relative 'index_type'
require_relative 'key'
require_relative 'index_name_or_index_column_name'
require_relative 'constraint'
require_relative 'constraint_name'
require_relative 'foreign'
require_relative 'foreign_key_column_name'
require_relative 'references'
require_relative 'foreign_table'
require_relative 'foreign_column'
require_relative 'on'
require_relative 'delete_update'
require_relative 'foreign_key_option1'
require_relative 'foreign_key_option2'

require_relative 'database'
require_relative 'if'
require_relative 'not'
require_relative 'exists'
require_relative 'database_name'

require_relative 'drop'
require_relative 'not'

require_relative 'column_stack'
require_relative 'table_indexes_stack'

require_relative 'write_migration'
require_relative 'write_activerecord'

require_relative 'only_characters'

class Node
	attr_accessor :value, :left_node, :right_node, :data
	
	def initialize(data=nil, value=nil ,left_node=nil, right_node=nil)
		@data = data
		@value = value
		@left_node = left_node
		@right_node = right_node
	end
end

class BinaryTree
	attr_reader :root_node, :current_node, :column_definition, :temp_column_name, :temp_column_type,
              :temp_column_constrain, :temp_index_type, :temp_index_column_name, :temp_index_name,
              :table_indexes, :table_name,
              :temp_foreign_key_column_name, :temp_referenced_table, :temp_referenced_column,
              :temp_foreign_key_delete_option, :temp_foreign_update_option

	def initialize()#data = nil, value = nil)
		#@root_node = Node.new(data,value)
		#transitions()
    @table_name = nil

    @column_definition = Column_Stack.new()
    @temp_column_name = nil
    @temp_column_type = nil
    @temp_column_constrain = Array.new

    @table_indexes = TableIndexesStack.new()
    @temp_index_type = nil
    @temp_index_column_name = nil
    @temp_index_name = nil

    @temp_foreign_key_column_name = nil
    @temp_referenced_table = nil
    @temp_referenced_column = nil
    @temp_foreign_key_delete_option = nil
    @temp_foreign_key_update_option = nil
	end

	def add(data,value)
		if @root_node.nil?
			@root_node = Node.new(data,value)
      @current_node = @root_node
		else
			add_node(@root_node,data,value)
		end
	end

	def add_node(node,data,value)
		return Node.new(data,value) if not node
		if value > node.value
			node.right_node = add_node(node.right_node, data, value)
		elsif value < node.value
			node.left_node = add_node(node.left_node, data, value)
		end
		return node
	end

	def printorder()
		preorder(@root_node)
		#print(@root_node)
	end

	def preorder(node)
		return if node == nil
		puts node.value
		puts node.data
		preorder(node.left_node)
		preorder(node.right_node)
	end

	def find_value(value)
		return findnodeWithValue(@root_node,value)
	end

	def findnodeWithValue(node,value)
		return Node.new("not valid",-1) if node == nil
		return node if node.value == value
		findnodeWithValue(node.left_node,value)
		findnodeWithValue(node.right_node,value)

	end

	def find_data(data)
		return findnodeWithData(@root_node,data)
	end

	def findnodeWithData(node,data)
		return Node.new("not valid",-1) if node == nil
		return node if node.data == data
		findnodeWithData(node.left_node,data)
		findnodeWithData(node.right_node,data)

	end

	#def print(node)
	#	puts node.data
	#	puts node.value
	#end

	def transitions
		add("start",0)
		add("CREATE",1)
		add("TABLE",2)
		add("TableName",3)
		add("(",4)
		add("COLUMN_NAME",5)
		add("COLUMN_TYPE",6)
		add("COLUMN_CONSTRAINTS",7)
		add("TABLE_CONSTRAINTS",8)
		add(");",9)
	end

	def check(token)
    @current_node = next_node(token,@current_node)
    #if @current_node == "end"
    #  puts "Here write, because we are in last transition"
    #  puts "another Idea is to write at end of initiate_class, I need to modify case statement and make return at end for all "
    #end

    right_variables = Hash["TableName" => "82", "COLUMN_NAME" => "84", "COLUMN_TYPE" => "85",
                           "COLUMN_CONSTRAINTS" => "88", "INDEX_TYPE" => "90", "INDEX_NAME_OR_INDEX_COLUMN_NAME" => "93",
                           "CONSTRAINT" => "94","KEY" => "91",
                           "CONSTRAINT_NAME" => "95", "FOREIGN_KEY_COLUMN_NAME" => "98", "FOREIGN_TABLE" => "100",
                           "FOREIGN_COLUMN" => "101", "DELETE_UPDATE" => "103", "FOREIGN_KEY_OPTION1" => "105",
                           "FOREIGN_KEY_OPTION2" => "106"]
    if @current_node.data == token or right_variables.has_key?(@current_node.data)
      success = initiate_class(@current_node.data, token)
      case success
        when true
          return_value = true
        when token
          @current_node = @root_node
          return_value = token
        when "Go_To_Col_type_Transition"
          @current_node = find_data("COLUMN_TYPE")
          return_value = true
        when "Go_to_Table_Constraints" #I think this has been removed
          return_value = token
        when "Go_TO_END" #check this where it is ?
          return_value = token
        when "Go_To_bracket_Transition"
          @current_node = find_data("(")
          return_value = token

        when "Go_To_KEY_Transition"
          @current_node = find_data("KEY") #may I need to change the search method to find_value in case there is
          return_value = true              #another transition has same data will be there  later.
        when "Go_To_COLUMN_CONSTRAINT"
          @current_node = find_data("COLUMN_CONSTRAINTS")
          return_value = token

        when "Go_To_FOREIGN_COLUMN_Transition"
          @current_node = find_data("FOREIGN_COLUMN")
          return_value = true
      end
    else
        @current_node = @root_node
        return_value = token
    end

    return return_value
  end

  def next_node(token,current)
    right_variables = Hash["TableName" => "82", "COLUMN_NAME" => "84", "COLUMN_TYPE" => "85",
                           "COLUMN_CONSTRAINTS" => "88", "INDEX_TYPE" => "90", "CONSTRAINT" => "94",
                           "FOREIGN_KEY_OPTION2" => "106"]
    #left_variables = Hash[]

    if current.right_node != nil and current.left_node == nil
      return_next_node = current.right_node
    end

    if current.right_node == nil and current.left_node != nil
      return_next_node = current.left_node
    end

    if current.right_node != nil and current.left_node != nil
      if current.left_node.data == token
        return_next_node = current.left_node
      elsif current.right_node.data == token or right_variables.has_key?(current.right_node.data) #just pass, the token will be handled by the class it self
        return_next_node = current.right_node
      end
      #may I need to return something here in case there is no return from both previous if's
    end

    if current.right_node == nil and current.left_node == nil
      puts "Im in nil nil both nods"
      #return_next_node = "end" #this return will give error, I need to change it later to something else. maybe @root_node
      return_next_node = @root_node
    end

    if return_next_node != nil
      return return_next_node
    else
      return @root_node
    end

  end

	def initiate_class(valid_transition, token)
    name_only =  OnlyCharacters.new()
    case valid_transition
			when "CREATE"
				Create.new(valid_transition)
        return true

			when "DATABASE"
				Database.new(valid_transition)
        return true

			when "TABLE"
				Table.new(valid_transition)
        return true

			when "TableName"
        valid_name = TableName.new()
        result = valid_name.table_name(token)
        if result == true
          @table_name = valid_name.table_name_needed()
        end
        return result

			when "("
				Bracket.new(valid_transition)
        @column_definition = Column_Stack.new()
        return true

      when "COLUMN_NAME"
        valid_name = Column_Name.new()
        result = valid_name.columnNameCheck(token)
        if result == true
          @temp_column_name = valid_name.column_name_needed()
        end
        return result

      when "COLUMN_TYPE"
        valid_type = Column_Type.new()
        result = valid_type.columnTypeCheck(token)
        if result == true
          @temp_column_type = valid_type.type_returned()
        end
        return result

			when "COLUMN_CONSTRAINTS"
        valid_CONSTRAINTS = Column_Constraints.new()
        result = valid_CONSTRAINTS.columnConstraintsCheck(token)
        if result == true or result == "Go_To_Col_type_Transition"
          times_in = valid_CONSTRAINTS.in_class_times()
          @temp_column_constrain[times_in] = token
          valid_CONSTRAINTS.in_class_times_increase()
          if result == true
            push_to_column_definition_stack()
          end
        end

        return result

      when "INDEX_TYPE"
        valid_Type = IndexType.new()
        result = valid_Type.index_type_check(token)
        if result == true
          @temp_index_type = token
        end
        return result

      when "KEY"
        validate_token = Key.new()
        result = validate_token.validate(token)
        if result == true and token != "KEY"
          @temp_index_name = name_only.to_characters_only(token)
        end
        return result

      when "INDEX_NAME_OR_INDEX_COLUMN_NAME"
        valid_transition = IndexNameOrIndexColumnName.new()
        result = valid_transition.validate(token)
        if result == "Go_To_KEY_Transition"
          @temp_index_name = name_only.to_characters_only(token)
        elsif result == true
          @temp_index_column_name = name_only.to_characters_only(token)
          push_to_table_indexes_stack()
        end
        return result

      when "CONSTRAINT"
        valid_transition = Constraint.new()
        result = valid_transition.validate(token)
        return result

      when "CONSTRAINT_NAME"
        valid_transition = ConstraintName.new()
        result = valid_transition.validate(token)
        return result

      when "FOREIGN"
        valid_transition = Foreign.new()
        result = valid_transition.validate(token)
        return result

      when "FOREIGN_KEY_COLUMN_NAME"
        valid_transition = ForeignKeyColumnName.new()
        result = valid_transition.foreignKeyColumnNameCheck(token)
        if result==true
          @temp_foreign_key_column_name = name_only.to_characters_only(token)
        end
        return result

      when "REFERENCES"
        valid_transition = References.new()
        result = valid_transition.validate(token)
        return result

      when "FOREIGN_TABLE"
        valid_transition = ForeignTable.new()
        result = valid_transition.table_name(token)
        if result==true
          @temp_referenced_table = name_only.to_characters_only(token)
        end
        return result

      when "FOREIGN_COLUMN"
        valid_transition = ForeignColumn.new()
        result = valid_transition.column_name(token)
        if result == true
          @temp_referenced_column = name_only.to_characters_only(token)
        end
        return result

      when "ON"
        valid_transition = On.new()
        result = valid_transition.validate(token)
        return result

      when "DELETE_UPDATE"
        valid_transition = Delete_Update.new()
        result = valid_transition.validate(token)
        if result == true
          valid_transition.pass_times_increase()
        end
        return result

      when "FOREIGN_KEY_OPTION1"
        valid_transition = ForeignKeyOption1.new()
        result = valid_transition.validate_option(token,$number_of_passes)
        if $number_of_passes == 1
        @temp_foreign_key_delete_option = valid_transition.get_option()
        elsif $number_of_passes == 2
          @temp_foreign_key_update_option = valid_transition.get_option()
        end
        return result

      when "FOREIGN_KEY_OPTION2"
        puts $number_of_passes
        valid_transition = ForeignKeyOption2.new()
        result = valid_transition.validate_option(token,$number_of_passes)
        if $number_of_passes == 1
          @temp_foreign_key_delete_option = valid_transition.get_option(token)
        elsif $number_of_passes == 2
          @temp_foreign_key_update_option = valid_transition.get_option(token)
        end
        return result

      when ");"
        Bracket.new(valid_transition)
        puts "============Write Column Definition================="

        my_info = @column_definition.get()
        my_info.each_index do |i|
          puts "---- column # :#{i}"
          puts my_info[i].columnName
          puts my_info[i].columnType

          constrain = my_info[i].columnConstrain
          constrain.each_index do |j|
            puts constrain[j]
          end
        end

        if @table_indexes != nil  #it should be empty maybe
          puts "============Write Table Indexes================="
          my_info = @table_indexes.get()
          my_info.each_index do |i|
            puts "---- index # :#{i}"
            puts my_info[i].index_type
            puts my_info[i].index_column_name
            puts my_info[i].index_name
          end
        end

        puts "============Write Table Name================="
        puts "Table name is : #{@table_name}"
        puts

        if temp_foreign_key_column_name != nil
          puts "============Write constraint information Name============="
          puts "The Current table name :#{@table_name}"
          puts "The Foreign key column name is :#{@temp_foreign_key_column_name}"
          puts "The Referenced table is : #{@temp_referenced_table}"
          puts "The Referenced column is :#{@temp_referenced_column}"
          puts "On delete option is :#{@temp_foreign_key_delete_option}"
          puts "On update option is :#{@temp_foreign_key_update_option}"
          puts
          puts
        end


        #write_class
        write_migration_file = Write_Migration.new()
        write_migration_file.write_migration_script(@table_name, @column_definition, @table_indexes)

        write_activerecord_file = Write_ActiveRecord.new()
        write_activerecord_file.write_active_record_script(@table_name,@temp_foreign_key_column_name,
                                                           @temp_referenced_table,@temp_referenced_column,
                                                           @table_indexes)

        clear_current_collected_information()
        return true

			when "DROP"
				Drop.new(token)
        return true

      when "IF"
        If.new(token)
        return true

      when "NOT"
        Not.new(token)
        return true

      when "EXISTS"
        Exists.new(token)
        return true

      when "DatabaseName"
        DatabaseName.new(token)
        return true
    end

    #if @column_definition_loop != nil
    #  puts "The @column_definition_loop now is : #{@column_definition_loop}"
    #end

  end

	def push_to_column_definition_stack()
    @column_definition.push(@temp_column_name, @temp_column_type, @temp_column_constrain)
    @temp_column_name = nil
    @temp_column_type = nil
    @temp_column_constrain = []
    $times_in = 0
  end

  def push_to_table_indexes_stack()
    @table_indexes.push(@temp_index_type, @temp_index_column_name, @temp_index_name )
    @temp_index_type = nil
    @temp_index_column_name = nil
    @temp_index_name = nil
  end

  def clear_current_collected_information()
    @table_name = nil

    @column_definition = Column_Stack.new()

    @table_indexes = TableIndexesStack.new()


    @temp_foreign_key_column_name = nil
    @temp_referenced_table = nil
    @temp_referenced_column = nil
    @temp_foreign_key_delete_option = nil
    @temp_foreign_key_update_option = nil
    $number_of_passes = 0
  end

end