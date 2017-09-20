require 'spec_helper'
require 'open_graph_data_fetcher'

describe OpenGraphDataFetcher do
  describe "call" do
    it "returns an object containing the open graph attributes on the given webpage" do
      test_url = "https://news.harvard.edu/gazette/story/2017/08/when-it-comes-to-internet-privacy-be-very-afraid-analyst-suggests/"
      stubbed_response = File.read("spec/fixtures/og_data_example.html")

      stub_request(:get, test_url).and_return(stubbed_response)

      expected_result = {
        "locale" => "en_US",
        "site_name" => "Harvard Gazette",
        "title" => "When it comes to internet privacy, be very afraid, analyst suggests",
        "type" => "article",
        "url" => "https://news.harvard.edu/gazette/story/2017/08/when-it-comes-to-internet-privacy-be-very-afraid-analyst-suggests/",
        "description" => "Cybersecurity expert Bruce Schneier, a fellow with the Berkman Klein Center for Internet & Society, discusses what consumers can do to protect themselves from government and corporate surveillance. ",
        "image" => "https://harvardgazette.files.wordpress.com/2017/07/071117_schneier_2835_605.jpg",
        "image:width"=>"605",
        "image:height"=>"403"
      }

      result = OpenGraphDataFetcher.call(test_url)
      expect(result).to eq(expected_result)
    end
  end
end
