class AddTagToTshirts < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :tags, :string
  end
end
