ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "minitest/pride"

require "minitest/reporters"
Minitest::Reporters.use!(
    Minitest::Reporters::DefaultReporter.new,
  ENV,
  Minitest.backtrace_filter
)
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  set_fixture_class static_pages: Optimadmin::StaticPage
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
