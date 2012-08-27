class TB_Node_stack
  attr_accessor :tableName

  def initialize(tableName=nil)
    @tableName = tableName
  end
end


class TableName_Stack
  def initialize()
    @the_stack = []
  end

  def push(table_Name)
    col = TB_Node_stack.new(table_Name)
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

  def reverse
    @the_stack2 = @the_stack.reverse
  end
end