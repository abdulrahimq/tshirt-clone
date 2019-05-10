class AddDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :photo
      t.string :title
      t.string :description
      t.string :tags
      t.integer :margin
      t.references :user, foreign_key: true
    end
  end
end
