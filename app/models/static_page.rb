class StaticPage < ActiveRecord::Base
  validates :name, :route, presence: true, uniqueness: { case_sensitive: false }
end
