require "test/unit"
require_relative "../write_activerecord"

class TestWriteActiverecord < Test::Unit::TestCase
  def test_active_record_script()
    write = Write_ActiveRecord.new()
    new_table_name =write.write_active_record_script("hello")
    assert_equal new_table_name, "Hello"

    new_table_name =write.write_active_record_script("Hello")
    assert_equal new_table_name, "Hello"
  end
end