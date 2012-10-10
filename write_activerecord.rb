require_relative "relation_stack"
require_relative "table_name_stack"
require_relative "uppercase_first_letter"

class Write_ActiveRecord
  $files_need_to_be_closed = TableName_Stack.new()
  $relations = Relation_Stack.new()

  def write_active_record_script(tableName, foreign_key_column_name,
                                 referenced_table,referenced_column,
                                 tableIndexes)
    pushCurrentTable(tableName)
    primaryKey = nil
    primaryKey = findPrimaryKey(tableIndexes)

    file_name = tableName.downcase
    File.open("dbfiles/migrate/#{file_name}.rb", 'w') do |f2|
      f2.puts "require 'rubygems'"
      f2.puts "require 'active_record'"
      f2.puts "\n"

      upper = UppercaseFirstLetter.new()
      upper_tableName = upper.uppercase_first_letter(tableName)
      oc = '"'
      f2.puts "class #{upper_tableName} < ActiveRecord::Base"
      f2.puts "\tself.table_name = #{oc}#{tableName}#{oc}"
      if primaryKey != nil
        f2.puts "\tself.primary_key = #{oc}#{primaryKey}#{oc}"
      end

      if foreign_key_column_name != nil
        f2.puts "\tbelongs_to :#{referenced_table}, :foreign_key => #{oc}#{foreign_key_column_name}#{oc}"
        pushCurrentTable_relation(tableName,referenced_table)
      end

      return tableName
    end
  end

  def findPrimaryKey(tableIndexes)
    pk = nil
    tableIndexes_info = tableIndexes.get()
    tableIndexes_info.each_index do |i|
      if tableIndexes_info[i].index_type == "PRIMARY"
        pk = tableIndexes_info[i].index_column_name
      end
    end
    return pk
  end

  def pushCurrentTable_relation(tableName,referenced_table)
    $relations.push(tableName,referenced_table)
  end

  def pushCurrentTable(tableName)
    $files_need_to_be_closed.push(tableName)
  end

end