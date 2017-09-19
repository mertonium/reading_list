require 'open-uri'

class OpenGraphDataFetcher
  attr_reader :url

  def self.call(url)
    new(url).go
  end

  def initialize(url)
    @url = url
  end

  def go
    webpage = Nokogiri::HTML(open(@url))
    og_metas = webpage.css("meta[property]").select{ |m| m['property'] =~ /^og\:/ }
    ret_object = {}

    og_metas.each do |meta|
      ret_object[meta['property'].gsub(/^og\:/, '')] = meta['content']
    end

    ret_object
  end
end
