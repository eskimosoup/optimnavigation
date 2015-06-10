module Optimadmin
  class StaticPage < ActiveRecord::Base
    has_many :menu_items, as: :menu_resource
    validates :name, :route, presence: true, uniqueness: { case_sensitive: false }

  end
end
