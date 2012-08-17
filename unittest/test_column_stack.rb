require 'test/unit'
require_relative '../column_stack'

class TestColumn < Test::Unit::TestCase
	def test_stack_method
		stack = Column_Stack.new()

		stack.push('Fin',1 ,["NOT", "NULL,"])
		stack.push('Min',2 ,["DEFAULT", "NULL,"])
		stack.push('Lin',3 ,["DEFAULT", "NULL,"])

		puts stack.count
    stack.print
    puts "-----------"
		val = stack.pop()
  	puts "The poped value is : #{val.columnName}"

		mystack = stack.get()
		mystack.each_index do |i|
			puts mystack[i].columnName
			puts mystack[i].columnType
      #puts mystack[i].columnConstrain[0]
      #puts mystack[i].columnConstrain[1]

      mycons = mystack[i].columnConstrain
      mycons.each_index do |j|
         puts mycons[j]
      end
		end

		#stack.reverse()
		#stack.print_rev()
		
		stack2 = Column_Stack.new()
		stack2.push('id','int',["DEFAULT", "NULL,"])
		expected = stack2.get()
		assert_equal expected[0].columnName, 'id'
		assert_equal expected[0].columnType, 'int'
	end
end