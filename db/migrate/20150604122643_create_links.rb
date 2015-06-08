class CreateLinks < ActiveRecord::Migration
  def change
    create_table :optimadmin_links do |t|
      t.string :resource_type
      t.integer :resource_id

      t.timestamps null: false
    end
  end
end
