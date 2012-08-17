
H = Hash["a" => 100, "b" =>200]

h = { "d" => 100, "a" => 200, "v" => 300, "e" => 400 }

typeTable = Hash["VARCHAR" => ":string", "TEXT" => ":text", "INT" => ":integer", "FLOAT"=> ":float",
		 "DECIMAL" => ":decimal","DATETIME" => ":datetime", "TIMESTAMP" => ":timestamp",
		 "TIME" => ":time", "DATE" => ":date", "BINARY" => ":binary", "TINYINT" => ":boolean"]

puts H['a']
puts "#{H['b']}"

puts "#{typeTable['INT']}"
puts typeTable.length
puts typeTable.has_key?("INT")
puts typeTable.value?(":time")