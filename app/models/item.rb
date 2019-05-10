class Item < ApplicationRecord
  belongs_to :design
  belongs_to :order
end
