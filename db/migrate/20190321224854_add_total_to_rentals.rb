class AddTotalToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :total, :integer
    remove_column :rentals, :content
    remove_column :rentals, :text
  end
end
