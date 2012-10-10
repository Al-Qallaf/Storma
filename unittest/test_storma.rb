require "test/unit"
require_relative "../storma"

class TestStorma < Test::Unit::TestCase
  def test_file_io
    test_run = Storma.new()
    test_run.start()
  end
end