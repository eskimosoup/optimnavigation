module Optimadmin
  class Link < ActiveRecord::Base
    belongs_to :menu_item
    validates :resource_type, :resource_id, presence: true

    include ActionDispatch::Routing::UrlFor
    include Rails.application.routes.url_helpers

    def self.find_item(resource_type, resource_id)
      where(resource_type: resource_type, resource_id: resource_id)
    end

    def destination
      if resource_type == 'ExternalLink'
        Object.const_get("Optimadmin::#{resource_type}").find(resource_id).route
      elsif resource_type == 'StaticPage'
        path = Object.const_get("Optimadmin::#{resource_type}").find(resource_id).route
        send(path)
      else
        url_for(controller: resource_type.to_s.tableize, id: resource_id, action: 'show', only_path: true)
      end
    end
  end
end
