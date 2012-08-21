class ConstrainInfo
	attr_accessor :constrain, :constrainName

	def initialize(constrain = nil, constrainName = nil)
    @constrain = constrain
    @constrainName = constrainName
	end
end


class TableConstrainStack
  def initialize()
   @the_stack = []
   @the_stack2 = []
  end

  def push(constrain,constrainName)
	  col = ConstrainInfo.new(constrain, constrainName)
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