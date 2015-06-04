module Optimadmin
  class ExternalLink < ActiveRecord::Base
    validates :route, presence: true
  end
end
