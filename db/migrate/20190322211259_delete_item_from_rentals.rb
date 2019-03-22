class DeleteItemFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :item_id
  end
end
