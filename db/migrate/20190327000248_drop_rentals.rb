class DropRentals < ActiveRecord::Migration[5.2]
  def change
    drop_table :rentals
  end
end
