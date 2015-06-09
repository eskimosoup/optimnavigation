module Optimadmin
  class Link < ActiveRecord::Base
    has_one :menu_item
    validates :resource_type, :resource_id, presence: true

    include ActionDispatch::Routing::UrlFor
    include Rails.application.routes.url_helpers

    def self.find_item(resource_type, resource_id)
      where(resource_type: resource_type, resource_id: resource_id)
    end

    def destination
      if resource_type == 'Optimadmin::ExternalLink'
        begin
          resource = Object.const_get("Optimadmin::#{resource_type}").find(resource_id)
          resource = resource.name if resource.present?
        rescue
          nil
        end
      elsif resource_type == 'Optimadmin::StaticPage'
        begin
          path = Object.const_get("Optimadmin::#{resource_type}").find(resource_id)
          path = path.route if path.present?
          send(path) if self.respond_to?(path)
        rescue
          nil
        end
      else
        url_for(controller: resource_type.to_s.tableize, id: resource_id, action: 'show', only_path: true)
      end
    end
  end
end
