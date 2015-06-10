module Optimadmin
  class MenuItem < ActiveRecord::Base
    has_closure_tree order: :position, dependent: :delete_all

    validates :menu_name, presence: true, length: { maximum: 100 }
    validates :name, presence: true, length: { maximum: 100 }
    validates :title_attribute, length: { maximum: 100 }

    belongs_to :link, class_name: "Optimadmin::Link", dependent: :destroy

    accepts_nested_attributes_for :link

    before_save :check_title_attr
    before_destroy :check_last_external_link

    def check_title_attr
      self.title_attribute = self.name if self.title_attribute.blank? or self.name_was == self.title_attribute
    end

    def check_last_external_link
      return unless self.link.resource_type == 'Optimadmin::ExternalLink'

      # FIXME: this needs tidying maybe?
      results = Optimadmin::Link.where(resource_type: 'Optimadmin::ExternalLink', resource_id: self.link.resource_id)
      Optimadmin::ExternalLink.destroy(results.first.resource_id) if results.size == 1
    end
  end
end
