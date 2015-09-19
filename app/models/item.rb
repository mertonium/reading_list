class Item < ActiveRecord::Base
  validates :title, presence: true

  def blurb_as_html
    Kramdown::Document.new(blurb).to_html
  end
end
