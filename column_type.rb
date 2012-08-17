class Column_Type
  attr_reader :token_type_value

  def initialize()
    @typeTable = Hash["varchar" => ":string", "text" => ":text", "int" => ":integer", "float"=> ":float",
                      "decimal" => ":decimal","datetime" => ":datetime", "timestamp" => ":timestamp",
                      "time" => ":time", "date" => ":date", "binary" => ":binary", "tinyint" => ":boolean"]
    puts 'In Column_Type class'
    @token_type_value = nil
  end

  def columnTypeCheck(token)
    case token
      when /^[a-zA-Z]*\(\d+\)$/
        theType = token.split('(')
        if @typeTable.has_key?(theType[0])
          theKey = theType[0]
          @token_type_value = @typeTable[theKey]
          return true
        else
          return token
        end

      when /^[a-zA-Z]*$/
        puts 'column Type letters only'
        if @typeTable.has_key?(token)
          theKey = token
          @token_type_value = @typeTable[theKey]
          return true
        else
          return token
        end

      else
        puts 'Error, column type not valid'
        return token
    end

  end

  def type_returned
    return @token_type_value
  end

  def start_loop()
    return "yes"
  end
end