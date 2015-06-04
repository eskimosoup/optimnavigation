class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :optimadmin_static_pages do |t|
      t.string :name
      t.string :route

      t.timestamps null: false
    end
  end
end
