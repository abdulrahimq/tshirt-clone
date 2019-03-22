class Tshirt < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :name, :description, :tags
  end

  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
end
