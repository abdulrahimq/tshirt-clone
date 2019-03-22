class AddDefaultPriceToTshirt < ActiveRecord::Migration[5.2]
  def change
    change_column :tshirts, :price, :float, :default => 10.00
  end
end
