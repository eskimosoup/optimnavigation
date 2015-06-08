module Optimadmin
  class MenuItem < ActiveRecord::Base
    has_closure_tree order: :position

    validates :menu_name, presence: true, length: { maximum: 100 }
    validates :name, presence: true, length: { maximum: 100 }
    validates :title_attribute, length: { maximum: 100 }

    has_one :link

    before_save :check_title_attr

    def check_title_attr
      self.title_attribute = self.name if self.title_attribute.blank? or self.name_was == self.title_attribute
    end
  end
end
