require 'open-uri'
require 'nokogiri'

class OpenGraphDataFetcher
  attr_reader :url

  def self.call(initial_url)
    OpenGraphDataFetcher.new(initial_url).go
  end

  def initialize(given_url)
    @url = given_url
  end

  def go
    webpage = Nokogiri::HTML(open(url))
    og_metas = webpage.css("meta[property]").select{ |m| m['property'] =~ /^og\:/ }
    ret_object = {}

    og_metas.each do |meta|
      ret_object[meta['property'].gsub(/^og\:/, '')] = meta['content']
    end

    ret_object
  end
end
