require "test_helper"

class ListTest < ActiveSupport::TestCase
  def list
    @list ||= List.new
  end

  def test_valid
    assert list.valid?
  end
end
