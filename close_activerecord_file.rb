class CloseActiveRecordFile
  def initialize()

  end

  def all_active_record_files(files_need_to_be_closed)
    classes = files_need_to_be_closed.get()
    classes.each_index do |i|
      #open file which is in referencedTable
      #add has_many: #{tableName]
      File.open("dbfiles/migrate/#{classes[i].tableName}.rb", 'a') do |f2|
        f2.puts "end"
      end
    end
  end
end