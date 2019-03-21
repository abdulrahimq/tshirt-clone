class AddItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :tshirts
      t.references :rentals
      t.integer :quantity

      t.timestamps
    end
  end
end
