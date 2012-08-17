class Column_Definition
	attr_accessor :columnName, :columnType, :columnConstrain
	
	def initialize(columnName=nil, columnType=nil, columnConstrain=nil)
		@columnName = columnName
		@columnType = columnType
    @columnConstrain = columnConstrain
	end
end


class Column_Stack
  def initialize()
   @the_stack = []
   @the_stack2 = []
  end

  def push(col_name,col_type,col_constrain)
	  col = Column_Definition.new(col_name, col_type, col_constrain)
    @the_stack.push col
  end

  def pop
    @the_stack.pop
  end

  def count
    @the_stack.length
  end
  
  def get
	  return @the_stack
  end
    
  def print
  	puts @the_stack
  end
	

	
  def print_rev
	puts @the_stack2[0].columnName
	puts @the_stack2[0].columnType
  end
  
  def reverse
	@the_stack2 = @the_stack.reverse
  end
end

# stack = Stack.new

# stack.push('Fin',1)
# stack.push('in',2)
# stack.push('in',3)

# puts stack.count
# stack.pop()
# mystack = stack.print()

# mystack.each_index do |i|
	# puts mystack[i].columnName
	# puts mystack[i].columnType
# end
#stack.reverse()
#stack.print_rev()

