class IndexesInfo
	attr_accessor :index_type, :index_column_name, :index_name

	def initialize(index_type = nil, index_column_name = nil, index_name = nil)
    @index_type = index_type
    @index_column_name = index_column_name
    @index_name = index_name
	end
end


class TableIndexesStack
  def initialize()
   @the_stack = []
   @the_stack2 = []
  end

  def push(index_type, index_column_name, index_name)
	  col = IndexesInfo.new(index_type, index_column_name, index_name)
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