class Tshirt < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 150 }
  validates :photo, presence: true
  include AlgoliaSearch


  algoliasearch do
    attribute :name, :description, :tags
  end

  monetize :price_cents
  belongs_to :user
  has_many :items
  mount_uploader :photo, PhotoUploader
end
