class AnimatedGif < ActiveRecord::Base
  has_many :lists

  validates :url, :alt, presence: true
end
