class AddOrderIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :Order_id, :integer
  end
end
