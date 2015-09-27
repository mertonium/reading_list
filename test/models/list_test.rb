require "test_helper"

class ListTest < ActiveSupport::TestCase
  def list
    @list ||= List.new
  end

  def test_valid
    assert list.valid?
  end

  def test_that_body_populates_from_items
    item1 = Item.create(title: 'Fake title', url: 'http://url1', blurb: 'Blah blah blah.')
    item2 = Item.create(title: 'Fake title 2', url: 'http://url2', blurb: 'Blah blah blah, again.')

    expected_str = <<-JMM.strip
[Fake title](http://url1)
Blah blah blah.

[Fake title 2](http://url2)
Blah blah blah, again.
    JMM

    assert_equal list.build_body_from_items([item1.id, item2.id]), expected_str
  end
end
