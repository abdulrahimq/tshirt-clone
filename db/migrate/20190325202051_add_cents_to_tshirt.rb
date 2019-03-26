class AddCentsToTshirt < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :price_cents, :integer, default: 2500
  end
end
