class Rental < ApplicationRecord
  belongs_to :user
  has_many :items
  before_save :update_total
  before_create :update_status
end

def calculate_total
  items.collect { |item| item.tshirt.price * item.quantity }.sum
end

private

def update_status
  if self.status == nil?
    self.status = "In progress"
  end
end

def update_total
  self.total = calculate_total
end

