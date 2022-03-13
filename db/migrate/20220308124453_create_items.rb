class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.string :item_image_id
      t.integer :price
      t.boolean :wrapping, default: "false"
      t.boolean :is_active, default: "true"


      t.timestamps
    end
  end
end
