class AddItemToRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :tshirt_id
    add_reference :rentals, :item, index: true
  end
end
