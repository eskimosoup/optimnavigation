module Optimadmin
  class MenuItem < ActiveRecord::Base
    has_closure_tree order: :position, dependent: :delete_all

    validates :menu_name, presence: true, length: { maximum: 100 }
    validates :name, presence: true, length: { maximum: 100 }
    validates :title_attribute, length: { maximum: 100 }

    attr_accessor :resource_type, :resource_id
    #validates :resource_type, :resource_id, presence: true

    belongs_to :link, class_name: "Optimadmin::Link", dependent: :destroy

    accepts_nested_attributes_for :link

    before_save :check_title_attr

    def check_title_attr
      self.title_attribute = self.name if self.title_attribute.blank? or self.name_was == self.title_attribute
    end
  end
end
