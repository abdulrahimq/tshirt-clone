class AddSkuToTshirts < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :sku, :string
  end
end
