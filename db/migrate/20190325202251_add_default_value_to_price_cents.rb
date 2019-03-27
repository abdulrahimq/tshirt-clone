class AddDefaultValueToPriceCents < ActiveRecord::Migration[5.2]
  def change
    change_column :tshirts, :price_cents, :integer, :default => 25
  end
end
