class ActiverecordRelationsFiles
  def initialize()

  end

  def add_to_activerecord_classes(relations)
    classes = relations.get()
    classes.each_index do |i|
      puts classes[i].tableName
      puts classes[i].referencedTable
      #open file which is in referencedTable
      #add has_many: #{tableName]

      File.open("../#{classes[i].referencedTable}.rb", 'a') do |f2|
        f2.puts "\thas_many :#{classes[i].tableName}"
      end
    end
  end
end