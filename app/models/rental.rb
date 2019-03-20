class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :tshirt
  validates :tshirt_id, :uniqueness => { scope: :user_id }
end
