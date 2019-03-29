class Tshirt < ApplicationRecord
  belongs_to :user
  include AlgoliaSearch


  algoliasearch do
    attribute :name, :description, :tags
  end

  monetize :price_cents
  belongs_to :user
  has_many :items
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
end
