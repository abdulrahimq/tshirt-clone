class Item < ApplicationRecord
  has_one :tshirt
  belongs_to :rental
end
