class AddItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :order, foreign_key: true
      t.references :design, foreign_key: true

      t.string :model
      t.string :size
      t.integer :quantity
      t.float :base_price
      t.float :total_cost
      t.integer :price_cents


      t.timestamps
    end
  end
end
