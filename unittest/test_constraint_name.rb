require "test/unit"
require_relative "../constraint_name"

class Test_transition_flow < Test::Unit::TestCase
  def test_flow()
    name_flow = ConstraintName.new()

    expected = name_flow.validate("`name`")
    assert_equal expected, true, "should be true"
    #assert_match expected, true, "good"


    expected = name_flow.validate("theName")
    assert_equal(expected, "theName" , " return same token to reset")


  end

  def test_wrong_flow()
    name_flow = ConstraintName.new()

    expected = name_flow.validate(nil)
    assert_equal(expected, nil , " return should be true")

  end


end