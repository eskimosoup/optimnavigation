class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :menu_name, limit: 100
      t.string :name, limit: 100
      t.integer :parent_id
      t.boolean :anchored, default: false
      t.boolean :new_window, default: false
      t.string :title_attribute, limit: 100
      t.integer :position, default: 0

      t.timestamps null: false
    end
  end
end
