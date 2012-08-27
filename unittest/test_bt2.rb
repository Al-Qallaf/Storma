require 'test/unit'
require_relative '../bt'
require_relative '../readio'
require_relative "../activerecord_relations_files"
require_relative "../close_activerecord_file"

class TestCreate < Test::Unit::TestCase
	def test1_check_method
		transitions()
    puts '--------------------------Test 1------------------------'
		#$transitions.printorder()
		#nod =$transitions.find_data("COLUMN_CONSTRAINTS")
		#puts '+++++++++++++++++++++++++++++++++'
		#puts nod.left_node.data
		#puts nod.right_node.data
		#puts '+++++++++++++++++++++++++++++++++'
		tokens = ["CREATE", "TABLE", "Customers"]
		tokens.each_index do |i|
			t = $transitions.check(tokens[i])
		end
	end
	
	
	def test2_check_method
		puts '--------------------------Test 2------------------------'
		tokens = ["CREATE", "DATABASE", "IF"]
		tokens.each_index do |i|
			returnToken = $transitions.check(tokens[i])
				if returnToken != true
					puts 'To handel last token (start from last invalid token)'
					$transitions.check(returnToken)
				end
			#nody = $transitions.find_value(1)
			#puts nody.data
		end
	end
	
	
	def test3_check_method
		puts '--------------------------Test 3------------------------'
		tokens = ["hahaha", "CREATE", "TABLE", "CREATE", "TABLE", "TableName", "(", "id", "int", "NOT,", "PRIMARY", ");"]
		tokens.each_index do |i|
			returnToken = $transitions.check(tokens[i])
			if (returnToken != true)
					puts 'To handel last token (start from last invalid token)'
					$transitions.check(returnToken)
			end
		end
	end

  def test4_check_method_one_column
    puts '--------------------------Test 4------------------------'
    tokens = ["wrong", "CREATE", "TABLE", "Salary", "(", "id", "int(11)", "NOT", "NULL,", ");"]
    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        puts 'To handel last token (start from last invalid token)'
        $transitions.check(returnToken)
      end
    end
  end

  def test5_check_method_two_column
    puts '--------------------------Test 5------------------------'
    tokens = ["CREATE", "TABLE", "Salary", "(", "`name`", "int(11)", "NOT", "NULL,",
                                                    "id", "varchar", "NOT", "NULL,", ");"]
    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        puts 'To handel last token (start from last invalid token)'
        $transitions.check(returnToken)
      end
    end
  end

  def test6_check_method_Four_columns
    transitions_added()
    puts '--------------------------Test 6------------------------'
    tokens = ["CREATE", "TABLE", "Salary", "(",
              "id", "varchar(50)", "NOT", "NULL,",
              "`name`", "int(11)", "NOT", "NULL,",
              "`date`", "date", "DEFAULT", "NULL,",
              ");"]
    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        puts 'To handel last token (start from last invalid token)'
        $transitions.check(returnToken)
      end
    end
  end

  def test7_check_method_with_Primary_key
    #transitions()
    transitions_added()
    puts '--------------------------Test 7------------------------'
    tokens = ["CREATE", "TABLE", "Salary", "(",
              "id", "varchar(50)", "NOT", "NULL", "DEFAULT", "'1',",
              "`date`", "date", "DEFAULT", "NULL,",
              "PRIMARY", "KEY", "(id)", ");", "Hello"]
    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        puts 'To handel last token (start from last invalid token)'
        $transitions.check(returnToken)
      end
    end
  end

  def test8_check_method_From_sql_file()
    puts '--------------------------Test 8------------------------'
    all_transitions_added()
    bufferTokens = Readio.new()
    tokens = bufferTokens.readthefile()

    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        puts 'To handel last token (start from last invalid token)'
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

  def test9_check_method_with_table_indexes()
    puts '--------------------------Test 9------------------------'
    transitions_added()
    tokens = ["CREATE", "TABLE", "Salary", "(",
              "id", "varchar(50)", "NOT", "NULL", "DEFAULT", "'1',",
              "`date`", "date", "DEFAULT", "NULL,",
              "PRIMARY", "KEY", "(`id`),",
              "UNIQUE", "KEY", "`i_name`", "(`address`),",
              "KEY", "`f_k_name`", "(`role`),",
              "KEY", "`index4`", "(`name`),", ");"]

    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        puts 'To handel last token (start from last invalid token)'
        $transitions.check(returnToken)
      end
    end
  end

  def test10_check_method_with_full_table_constraint()
    puts '--------------------------Test 10------------------------'
    all_transitions_added()
    tokens = ["CREATE", "TABLE", "Salary", "(",
              "id", "varchar(50)", "NOT", "NULL", "DEFAULT", "'1',",
              "`date`", "date", "DEFAULT", "NULL,",
              "PRIMARY", "KEY", "(`id`),",
              "UNIQUE", "KEY", "`i_name`", "(`address`),",
              "KEY", "`f_k_name`", "(`role`),",
              "KEY", "`index4`", "(`name`),",
              "CONSTRAINT", "`f_k_name`", "FOREIGN", "KEY", "(`role`)",
              "REFERENCES", "`roles`", "(`idroles`)",
              #"ON", "DELETE", "NO", "ACTION", "ON", "UPDATE", "NO", "ACTION",
              #"ON", "DELETE", "CASCADE", "ON", "UPDATE", "CASCADE",
              #"ON", "DELETE", "NO", "ACTION", "ON", "UPDATE", "CASCADE",
              "ON", "DELETE", "CASCADE", "ON", "UPDATE", "NO", "ACTION",
              ");"]

    tokens.each_index do |i|
      returnToken = $transitions.check(tokens[i])
      if (returnToken != true)
        puts 'To handel last token (start from last invalid token)'
        $transitions.check(returnToken)
      end
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
    $transitions.add(");",86)

    $transitions.add("INDEX_TYPE",90)
    $transitions.add("KEY",91)
    $transitions.add("INDEX_NAME_OR_INDEX_COLUMN_NAME",93)
    $transitions.add(");",92)

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
    $transitions.add(");",104)
    $transitions.add("FOREIGN_KEY_OPTION2",106)
    $transitions.add(");",107)



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

  def transitions_added()
    $transitions = BinaryTree.new()
    $transitions.add("start",50)
    $transitions.add("CREATE",80)
    $transitions.add("TABLE",81)
    $transitions.add("TableName",82)
    $transitions.add("(",83)
    $transitions.add("COLUMN_NAME",84)
    $transitions.add("COLUMN_TYPE",85)
    $transitions.add("COLUMN_CONSTRAINTS",88)
    #$transitions.add("TABLE_CONSTRAINTS",89)
    $transitions.add(");",86)
    #$transitions.add(");",90)
    $transitions.add("INDEX_TYPE",90)
    $transitions.add("KEY",91)
    $transitions.add("INDEX_NAME_OR_INDEX_COLUMN_NAME",93)
    $transitions.add(");",92)
    $transitions.add("CONSTRAINT",94)

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

  def transitions
		$transitions = BinaryTree.new()
		$transitions.add("start",50)
		$transitions.add("CREATE",80)
		$transitions.add("TABLE",81)
		$transitions.add("TableName",82)
		$transitions.add("(",83)
		$transitions.add("COLUMN_NAME",84)
		$transitions.add("COLUMN_TYPE",85)
		$transitions.add("COLUMN_CONSTRAINTS",88)
		$transitions.add("TABLE_CONSTRAINTS",89)
		$transitions.add(");",86)
		$transitions.add(");",90)

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