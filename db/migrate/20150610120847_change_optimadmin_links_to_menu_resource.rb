class ChangeOptimadminLinksToMenuResource < ActiveRecord::Migration
  def change
    rename_column :optimadmin_links, :resource_type, :menu_resource_type
    rename_column :optimadmin_links, :resource_id, :menu_resource_id
  end
end
