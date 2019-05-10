class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.boolean :artist
      t.boolean :admin
      t.string :photo
      t.string :provider, limit: 50, null: false, default: ''
      t.string :uid, limit: 500, null: false, default: ''

      t.timestamps null: false
    end
  end
end
