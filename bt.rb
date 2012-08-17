require "test/unit"
require_relative 'create'
require_relative 'table'
require_relative 'bracket'
require_relative 'table_name'
require_relative 'column_name'
require_relative 'column_type'
require_relative 'column_constraints'
require_relative 'table_constrain'

require_relative 'database'
require_relative 'if'
require_relative 'not'
require_relative 'exists'
require_relative 'database_name'

require_relative 'drop'
require_relative 'not'

require_relative 'column_stack'
require_relative 'table_constrain_stack'

require_relative 'write_migration'
require_relative 'write_activerecord'

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
	attr_reader :root_node, :current_node, :column_definition, :temp_column_name, :temp_column_type, :temp_column_constrain,
              :temp_table_constrain, :temp_table_constrain_name, :table_constrains, :table_name

	def initialize()#data = nil, value = nil)
		#@root_node = Node.new(data,value)
		#transitions()
    @table_name = nil

    @column_definition = Column_Stack.new()
    @temp_column_name = nil
    @temp_column_type = nil
    @temp_column_constrain = Array.new

    @table_constrains = TableConstrainStack.new()
    @temp_table_constrain = nil
    @temp_table_constrain_name = nil

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

    right_variables = Hash["TableName" => "82", "COLUMN_NAME" => "84", "COLUMN_TYPE" => "85", "COLUMN_CONSTRAINTS" => "88", "TABLE_CONSTRAINTS" => "89"]
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
        when "Go_to_Table_Constraints"
          return_value = token
        when "Go_TO_END" #check this where it is ?
          return_value = token
        when "Go_To_bracket_Transition"
          @current_node = find_data("(")
          return_value = token

        when "Go_To_Column_Constrain_Transition"
          @current_node = find_data("COLUMN_CONSTRAINTS")
          return_value = true

        #when "PRIMARY"
      end
      #if success == true
      #  return_value = true
      #elsif success == token
      #  @current_node = @root_node
      #  return_value = token
      #end
    else
        @current_node = @root_node
        return_value = token
    end
    #puts @column_definition.count
    #mystack = @column_definition.get()
    #mystack.each_index do |i|
    #  puts mystack[i].columnName
    #  puts mystack[i].columnType
    #end

    return return_value
  end

  def next_node(token,current)
    right_variables = Hash["TableName" => "82", "COLUMN_NAME" => "84", "COLUMN_TYPE" => "85", "COLUMN_CONSTRAINTS" => "88", "TABLE_CONSTRAINTS" => "89"]
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
		#@column_definition_loop = nil

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

      when "TABLE_CONSTRAINTS"
        #push_to_column_definition_stack()
        valid_CONSTRAINTS = TableConstrain.new()
        result = valid_CONSTRAINTS.table_constrains_check(token)
        if result == "Go_To_Column_Constrain_Transition"
          if token == "PRIMARY" #hash with all known words (for later for unique key)
            @temp_table_constrain = token
          end
        elsif result == true
          @temp_table_constrain_name = token
          push_to_table_constrain_stack()
        end
        return result

      when ");"
        Bracket.new(valid_transition)
        #push_to_column_definition_stack()
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

        puts "============Write Table Constrain================="

        if @table_constrains != nil
          my_info = @table_constrains.get()
          my_info.each_index do |i|
            puts "---- constrain # :#{i}"
            puts my_info[i].constrain
            puts my_info[i].constrainName
          end
        end

        puts "============Write Table Name================="
        puts "Table name is : #{@table_name}"

        #write_class
        write_migration_file = Write_Migration.new()
        write_migration_file.write_migration_script(@table_name, @column_definition)

        write_activerecord_file = Write_ActiveRecord.new()
        write_activerecord_file.write_active_record_script(@table_name)

        @table_name = nil
        @column_definition = Column_Stack.new()
        @table_constrains = TableConstrainStack.new()
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

  def push_to_table_constrain_stack()
    @table_constrains.push(@temp_table_constrain, @temp_table_constrain_name)
    @temp_table_constrain = nil
    @temp_table_constrain_name = nil
  end

end