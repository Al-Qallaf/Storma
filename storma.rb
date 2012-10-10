require 'test/unit'
require_relative 'bt'
require_relative 'readio'
require_relative 'activerecord_relations_files'
require_relative 'close_activerecord_file'

class Storma
  def initialize
    puts "SQL to Ruby Migration/ActiveRecord Starts"
  end

  def get_argument_file_name()
    return_file_name = nil
    ARGV.each do |a|
      return_file_name = a
    end
    return return_file_name
    #return "default.sql"   #for test
  end

  def start()
    argument = get_argument_file_name()
    puts "file name is : #{argument}"
    bufferTokens = Readio.new()
    tokens = bufferTokens.readthefile(argument)

    all_transitions_added()
    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        #puts 'To handel last token (start from last invalid token)'
        $transitions.check(returnToken)
      end
    end
    add_relation_to_active_record_files($relations)
    close_active_record_files($files_need_to_be_closed)
  end

  def add_relation_to_active_record_files(relations)
    if relations != nil
      relationship = ActiverecordRelationsFiles.new()
      relationship.add_to_activerecord_classes(relations)
    end
  end

  def close_active_record_files(files_need_to_be_closed)
    if files_need_to_be_closed != nil
      close = CloseActiveRecordFile.new()
      close.all_active_record_files(files_need_to_be_closed)
    end
  end

  def all_transitions_added()
    $transitions = BinaryTree.new()
    $transitions.add("start",50)
    $transitions.add("CREATE",80)
    $transitions.add("TABLE",81)
    $transitions.add("TableName",82)
    $transitions.add("(",83)
    $transitions.add("COLUMN_NAME",84)
    $transitions.add("COLUMN_TYPE",85)
    $transitions.add("COLUMN_CONSTRAINTS",88)
    $transitions.add(")",86)

    $transitions.add("INDEX_TYPE",90)
    $transitions.add("KEY",91)
    $transitions.add("INDEX_NAME_OR_INDEX_COLUMN_NAME",93)
    $transitions.add(")",92)

    $transitions.add("CONSTRAINT",94)
    $transitions.add("CONSTRAINT_NAME",95)
    $transitions.add("FOREIGN",96)
    $transitions.add("KEY",97)
    $transitions.add("FOREIGN_KEY_COLUMN_NAME",98)
    $transitions.add("REFERENCES",99)
    $transitions.add("FOREIGN_TABLE",100)
    $transitions.add("FOREIGN_COLUMN",101)
    $transitions.add("ON",102)
    $transitions.add("DELETE_UPDATE",103)
    $transitions.add("FOREIGN_KEY_OPTION1",105)
    $transitions.add(")",104)
    $transitions.add("FOREIGN_KEY_OPTION2",106)
    $transitions.add(")",107)

    $transitions.add("DATABASE",70)
    $transitions.add("IF",71)
    $transitions.add("NOT",72)
    $transitions.add("EXISTS",73)
    $transitions.add("DataBaseName",74)

    $transitions.add("DROP",20)
    $transitions.add("TABLE",19)
    $transitions.add("IF",18)
    $transitions.add("EXISTS",17)
    $transitions.add("TableName",16)
  end

end

main = Storma.new()
main.start()