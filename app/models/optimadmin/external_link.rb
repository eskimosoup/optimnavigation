module Optimadmin
  class ExternalLink < ActiveRecord::Base
    validates :website, presence: true
  end
end
