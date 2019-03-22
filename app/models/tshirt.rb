class Tshirt < ApplicationRecord
  belongs_to :user
  has_many :items
  mount_uploader :photo, PhotoUploader
  # validates :photo, presence: true
end
