class AddPriceToTshirts < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :price, :float
  end
end
