class Write_Migration
  def read_file()
    File.open('../read.rb', 'r') do |f1|
      while line = f1.gets
        puts line
      end
    end
  end

  def write_migration_script(tableName, columns, tableIndexes)
    column_definition = columns
    upper = UppercaseFirstLetter.new()
    file_name = tableName
    primaryKey = nil
    primaryKey = findPrimaryKey(tableIndexes)
    File.open("../create_#{file_name}.rb", 'w') do |f2|
      upper_tableName = upper.uppercase_first_letter(tableName)
      f2.puts "class Create#{upper_tableName} < ActiveRecord::Migration"
      f2.puts "\tdef self.up"
      if primaryKey != nil
        f2.puts "\t\tcreate_table :#{tableName}, { :primary_key => :#{primaryKey} } do |t|"
      elsif primaryKey == nil
        f2.puts "\t\tcreate_table :#{tableName} do |t|"
      end
      column_print = nil
      column_info = columns.get()
      column_info.each_index do |i|
        column_print = ":#{column_info[i].columnName}"
        column_print = column_print + ", #{column_info[i].columnType}"

        column_constrain_info = column_info[i].columnConstrain
        column_constrain_info.each_index do |j|
          case column_constrain_info[j]
            when "NOT"
              case column_constrain_info[j+1]
                when "NULL,", "NULL"
                  column_print = column_print + ", :null => false"
              end
            when "DEFAULT"
              case column_constrain_info[j+1]
                when "NULL,"
                  column_print = column_print + ", :default => nil"

                when /^'[a-zA-Z]*|\d*',$/ #handel ex. "'1',"  or "'new',"
                  value = column_constrain_info[j+1].split("'")
                  column_print = column_print + ", :default => #{value[1]}"
              end
          end
        end
        f2.puts "\t\t\tt.column #{column_print}"
      end
      f2.puts "\t\tend"
      f2.puts "\tend"
      f2.puts "\n"
      f2.puts "\tdef self.down"
      f2.puts "\t\tdrop_table :#{tableName}"
      f2.puts "\tend"
      f2.puts "end"
    end
    #write_active_record_script(tableName)
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

end