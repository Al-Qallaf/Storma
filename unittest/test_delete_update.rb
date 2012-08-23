require "test/unit"
require_relative "../delete_update"

class Delete_or_Update < Test::Unit::TestCase
  def test_delete_update_transition()
    name = Delete_Update.new()

    expected = name.validate("DELETE")
    assert_equal expected, true, "Return value  should be true"

    expected = name.validate("UPDATE")
    assert_equal expected, true, "Return value  should be true"

  end

  def test_nil()
    name = Delete_Update.new()

    expected = name.validate(nil)
    assert_equal(expected, nil, "Return value should be nil, here test nil")
  end

  def test_wrong_token()
    name = Delete_Update.new()

    expected = name.validate("word")
    assert_equal(expected, "word", "Return value should be same token")
  end
end