class Order < ApplicationRecord
  monetize :amount_cents
  has_many :items
end
