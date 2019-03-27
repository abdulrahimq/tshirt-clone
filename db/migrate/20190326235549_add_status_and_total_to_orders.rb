class AddStatusAndTotalToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total, :integer
    add_column :orders, :status, :string
  end
end
