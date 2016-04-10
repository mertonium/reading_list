require "test_helper"

class AnimatedGifTest < ActiveSupport::TestCase
  def animated_gif
    @animated_gif ||= AnimatedGif.new
  end

  def test_valid
    assert animated_gif.valid?
  end
end
