class DeletePhotoFromTshirts < ActiveRecord::Migration[5.2]
  def change
    remove_column :tshirts, :photo
  end
end
