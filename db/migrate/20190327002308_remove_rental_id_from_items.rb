class RemoveRentalIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :rental_id
  end
end
