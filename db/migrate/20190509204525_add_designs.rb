class AddDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :photo
      t.string :title
      t.string :description
      t.references :users, foreign_key: true
    end
  end
end
