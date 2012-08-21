require "test/unit"
require_relative "../index_type"

class Test_index_transition < Test::Unit::TestCase
  def test_transition_flow()
    flow = IndexType.new()

    result = flow.index_type_check("PRIMARY")
    assert_equal result, true

    result = flow.index_type_check("KEY")
    assert_equal result, true

    result = flow.index_type_check("UNIQUE")
    assert_equal result, true

    result = flow.index_type_check("id")
    assert_equal result, "Go_To_bracket_Transition"

    result = flow.index_type_check("`id`")
    assert_equal result, "Go_To_bracket_Transition"

    result = flow.index_type_check("23dsd")
    assert_equal result, "23dsd"


  end
end