

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

  def self.tagsArray(limit)
    dirtyArray = []
    Tshirt.all.each do |tshirt|
      if tshirt.tags != nil
      dirtyArray << tshirt.tags.strip.split(", ")
      end
    end
    cleanArray = dirtyArray.flatten
    cleanHash = Hash[cleanArray.uniq.map {|v| [v, cleanArray.count(v)] }].sort_by {|k,v| -v }[0...limit.to_i]
    finalArray = cleanHash.map {|k,v| k }.sort
  end
end
