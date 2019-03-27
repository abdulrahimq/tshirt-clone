class Item < ApplicationRecord
  belongs_to :tshirt
  belongs_to :order
end
