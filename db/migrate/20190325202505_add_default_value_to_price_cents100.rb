class AddDefaultValueToPriceCents100 < ActiveRecord::Migration[5.2]
  def change
    change_column :tshirts, :price_cents, :integer, :default => 2500
  end
end
