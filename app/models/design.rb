

class Design < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 150 }
  validates :photo, presence: true
  has_many :items
  mount_uploader :photo, PhotoUploader

  def self.tagsArray
    return ['chic', 'mens', 'women', 'business', 'casual', 'funny', 'social', 'aware']
  end
end
