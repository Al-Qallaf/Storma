require "test/unit"
require_relative "../column_type"

class Test_type < Test::Unit::TestCase
 def test_type()
   type_check = Column_Type.new()
   result = type_check.columnTypeCheck("int")
   assert_equal result, true
   if result == true
     expected = type_check.type_returned()
     assert_equal expected, ":integer"
   end

   type_check = Column_Type.new()
   result = type_check.columnTypeCheck("int(40)")
   assert_equal result, true
   if result == true
     expected = type_check.type_returned()
     assert_equal expected, ":integer"
   end

   type_check = Column_Type.new()
   result = type_check.columnTypeCheck("varchar(50)")
   assert_equal result, true
   if result == true
     expected = type_check.type_returned()
     assert_equal expected, ":string"
   end

   type_check = Column_Type.new()
   result = type_check.columnTypeCheck("ali(40)")
   assert_equal result, "ali(40)"

   type_check = Column_Type.new()
   result = type_check.columnTypeCheck("hello")
   assert_equal result, "hello"

 end
end