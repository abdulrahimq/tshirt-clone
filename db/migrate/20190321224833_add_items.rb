class AddItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :rental
      t.integer :quantity
      t.references :tshirt, foreign_key: true

      t.timestamps
    end
  end
end
