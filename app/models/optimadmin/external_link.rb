module Optimadmin
  class ExternalLink < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
  end
end
