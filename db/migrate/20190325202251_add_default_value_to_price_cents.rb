class AddDefaultValueToPriceCents < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :price_cents, :integer, :default => 25
  end
end
