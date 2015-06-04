class CreateExampleModules < ActiveRecord::Migration
  def change
    create_table :example_modules do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
