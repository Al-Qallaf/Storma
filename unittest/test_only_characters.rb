require "test/unit"
require_relative "../only_characters"

class MyCharactersTest < Test::Unit::TestCase

  def test_charactersOnlyTest
    nameTest =  OnlyCharacters.new
    result = nameTest.to_characters_only("(`Ali9_`)")
    assert_equal result, "Ali9_"

    result = nameTest.to_characters_only("Ali")
    assert_equal result, "Ali"

  end
end