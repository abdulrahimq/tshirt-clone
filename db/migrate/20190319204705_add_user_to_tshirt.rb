class AddUserToTshirt < ActiveRecord::Migration[5.2]
  def change
    add_reference :tshirts, :user, foreign_key: true
  end
end
