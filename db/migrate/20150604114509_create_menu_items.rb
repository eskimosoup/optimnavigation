class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :optimadmin_menu_items do |t|
      t.string :menu_name, limit: 100
      t.string :name, limit: 100
      t.integer :parent_id
      t.boolean :anchored, default: false
      t.boolean :new_window, default: false
      t.string :title_attribute, limit: 100
      t.integer :position, default: 0
      t.integer :link_id

      t.timestamps null: false
    end
    add_index :optimadmin_menu_items, :link_id
  end
end
