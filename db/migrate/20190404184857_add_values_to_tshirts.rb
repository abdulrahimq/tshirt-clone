class AddValuesToTshirts < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :x, :string
    add_column :tshirts, :y, :string
    add_column :tshirts, :height, :string
    add_column :tshirts, :width, :string
  end
end
