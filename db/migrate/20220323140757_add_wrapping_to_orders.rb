class AddWrappingToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :wrapping, :boolean, default: false
  end
end
