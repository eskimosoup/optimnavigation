module Optimadmin
  class ExternalLink < ActiveRecord::Base
    has_many :menu_items, as: :menu_resource
    validates :name, presence: true, uniqueness: true

    def destination
      name
    end
  end
end
