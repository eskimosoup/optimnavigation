class MenuItem < ActiveRecord::Base
  has_closure_tree order: :position

  validates :menu_name, presence: true, length: { maximum: 100 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :title_attribute, length: { maximum: 100 }
end
