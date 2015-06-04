class ChangeTableNames < ActiveRecord::Migration
  def self.up
    rename_table :external_links, :optimadmin_external_links
    rename_table :static_pages, :optimadmin_static_pages
  end
  def self.down
    rename_table :optimadmin_external_links, :external_links
    rename_table :optimadmin_static_pages, :static_pages
  end
end
