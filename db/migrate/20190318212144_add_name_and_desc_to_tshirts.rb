class AddNameAndDescToTshirts < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :name, :string
    add_column :tshirts, :description, :string
  end
end
