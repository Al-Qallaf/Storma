class Node_stack
  attr_accessor :tableName, :referencedTable

  def initialize(tableName=nil, referencedTable=nil)
    @tableName = tableName
    @referencedTable = referencedTable
  end
end


class Relation_Stack
  def initialize()
    @the_stack = []
    @the_stack2 = []
  end

  def push(table_Name,referenced_Table)
    col = Node_stack.new(table_Name, referenced_Table)
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
    puts @the_stack2[0].table_Name
    puts @the_stack2[0].referenced_Table
  end

  def reverse
    @the_stack2 = @the_stack.reverse
  end
end