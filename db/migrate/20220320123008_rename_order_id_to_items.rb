class RenameOrderIdToItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :Order_id, :order_id
  end
end
