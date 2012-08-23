require "test/unit"
require_relative "../constraint"

class Test_transition_flow < Test::Unit::TestCase
  def test_flow()
    name_flow = Constraint.new()

    expected = name_flow.validate("`name`")
    assert_equal expected, "`name`"

    expected = name_flow.validate("CONSTRAINT")
    assert_equal(expected, true, "Return value should be true")

    expected = name_flow.validate("KEY")
    assert_equal expected, "Go_To_COLUMN_CONSTRAINT", "Check if this var. in hash"

  end

  def test_wrong_flow()
    name_flow = Constraint.new()

    expected = name_flow.validate("CONSTRAINT")
    assert_equal(expected, nil, "Return value should be true, here test nil")

  end
end