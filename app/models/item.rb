require 'open_graph_data_fetcher'

class Item < ActiveRecord::Base
  has_and_belongs_to_many :lists

  # validates :title, presence: true
  validates :url, uniqueness: true
  validates :url, presence: true

  def self.create_from_open_graph_data(url)
    og_data = OpenGraphDataFetcher.call(url)
    puts "og_data = "
    puts og_data
    attrs = self.translateOpenGraphData(og_data)
    puts "attrs = "
    puts attrs
    if (attrs[:url].nil?)
      attrs[:url] = url
    end
    create!(attrs)
  end

  def blurb_as_html
    return unless blurb.present?
    Kramdown::Document.new(blurb).to_html
  end

  private

  def self.translateOpenGraphData(og_data)
    {
      title: og_data['title'],
      url: og_data['url'],
      published_at: og_data['updated_time'],
      blurb: og_data['description'].nil? ? nil : "> #{og_data['description']}",
      media_type: og_data['type']
    }
  end
end
