require "test_helper"
require 'open_graph_data_fetcher'

class ItemTest < ActiveSupport::TestCase
  def test_create_from_open_graph_data
    url = 'https://medium.com/@heidar/how-i-test-rails-apps-with-minitest-capybara-and-guard-5e07a6856781'
    mock = Minitest::Mock.new
    def mock.go
      {
        'title': "How I test Rails apps with Minitest, Capybara, and Guard",
        'url': url,
        'updated_time': "2016-01-11T23:15:53.593Z",
        'description': "I recently made the switch from RSpec to Minitest. I like small, simple tools which I can have a complete understanding of easily. I’d…",
        'type': 'article',
      }
    end

    OpenGraphDataFetcher.stub :new, mock do
      new_item = Item.create_from_open_graph_data(url)
      assert_equal new_item.title, "How I test Rails apps with Minitest, Capybara, and Guard"
    end
  end

  def test_blurb_as_html
    md_blurb =<<-JMM.strip
# Head 1

This is the body.
    JMM

    html_blurb =<<-JMM
<h1 id="head-1">Head 1</h1>

<p>This is the body.</p>
    JMM

    item = Item.new(blurb: md_blurb)
    assert_equal item.blurb_as_html, html_blurb
  end
end
