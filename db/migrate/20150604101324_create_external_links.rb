class CreateExternalLinks < ActiveRecord::Migration
  def change
    create_table :external_links do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
