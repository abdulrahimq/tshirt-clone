class AddPhotoToTshirts < ActiveRecord::Migration[5.2]
  def change
    add_column :tshirts, :photo, :string
  end
end
