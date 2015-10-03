class List < ActiveRecord::Base
  DRAFT = 0
  PUBLISHED = 1
  LIST_STATES = {
    DRAFT => "draft",
    PUBLISHED => "published"
  }

  has_and_belongs_to_many :items

  def build_body_from_items(item_ids)
    self.body = Item.find(item_ids).collect do |item|
      "[%s](%s)\n%s" % [item.title, item.url, item.blurb]
    end.join("\n\n")
  end

  def body_as_html
    Kramdown::Document.new(body).to_html
  end
end
