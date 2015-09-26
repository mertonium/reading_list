class Item < ActiveRecord::Base
  has_and_belongs_to_many :lists

  validates :title, presence: true

  def blurb_as_html
    Kramdown::Document.new(blurb).to_html
  end
end
