class CreateLinks < ActiveRecord::Migration
  def change
    create_table :optimadmin_links do |t|
      t.belongs_to :menu_item, index: true, foreign_key: true
      t.string :resource_type
      t.integer :resource_id

      t.timestamps null: false
    end
  end
end
