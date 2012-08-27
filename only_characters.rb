class OnlyCharacters
  def initialize
    puts "In onlyCharacters Class"
  end

  def to_characters_only(givenString)
    printableString = givenString.scan(/[A-Za-z0-9_]/).join
    return printableString
  end
end