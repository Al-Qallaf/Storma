class Write_ActiveRecord

  def write_active_record_script(tableName)
    file_name = tableName.downcase
    File.open("../#{file_name}.rb", 'w') do |f2|
      f2.puts "require 'rubygems'"
      f2.puts "require 'active_record'"
      f2.puts "\n"
      first_letter = tableName[0].capitalize!
      tableName[0] = first_letter
      f2.puts "class #{tableName} < ActiveRecord::Base"
      f2.puts "\n"
      f2.puts "end"

      return tableName
    end
  end
end