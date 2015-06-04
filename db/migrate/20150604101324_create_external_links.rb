class CreateExternalLinks < ActiveRecord::Migration
  def change
    create_table :optimadmin_external_links do |t|
      t.string :route

      t.timestamps null: false
    end
  end
end
