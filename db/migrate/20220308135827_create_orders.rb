class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :user_id
      t.integer :item_id
      t.integer :payment_method
      t.string :zip_code
      t.string :address
      t.string :name
      t.integer :total_price
      t.integer :quantity


      t.timestamps
    end
  end
end
