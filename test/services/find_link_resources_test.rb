require 'test_helper'

class FindLinkResourcesTest < ActiveSupport::TestCase

  test "rescues name error when constantize fails" do
    link_resources = FindLinkResources.new("blah")
    assert_nil link_resources.klass
  end

  test "sets klass correctly when class of that name exists" do
    link_resources = FindLinkResources.new("Optimadmin::StaticPage")
    assert_equal link_resources.klass, Optimadmin::StaticPage
  end

  test "returns nil when called if klass nil" do
    link_resources = FindLinkResources.new("blah")
    assert_nil link_resources.call
  end

  test "returns active record relation if klass exists" do
    link_resources = FindLinkResources.new("Optimadmin::StaticPage")
    assert_instance_of Array, link_resources.call
  end

  test "returns all objects in relation" do
    link_resources = FindLinkResources.new("Optimadmin::StaticPage")
    assert_equal link_resources.call.size, Optimadmin::StaticPage.count
  end

end