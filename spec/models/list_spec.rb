require 'rails_helper'

describe List do
  describe "#build_body_from_items" do
    it "builds a block of markdown from the given items" do
      item1 = Item.create(title: 'Fake title', url: 'http://url1', blurb: 'Blah blah blah.')
      item2 = Item.create(title: 'Fake title 2', url: 'http://url2', blurb: 'Blah blah blah, again.')

      expected_str = <<-JMM.strip
###[Fake title](http://url1)

Blah blah blah.

---

###[Fake title 2](http://url2)

Blah blah blah, again.
      JMM

      expect(List.new.build_body_from_items([item1.id, item2.id])).to eq(expected_str)
    end
  end
end
