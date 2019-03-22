class FixKeysToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :rental_id
    remove_column :items, :tshirt_id
    add_reference :items, :tshirt, index: true
    add_reference :items, :rental, index: true
  end
end
