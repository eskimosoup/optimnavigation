require 'test_helper'

class Optimadmin::MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should validate_presence_of(:menu_name)
  should validate_length_of(:menu_name).is_at_most(100)
  should validate_presence_of(:name)
  should validate_length_of(:name).is_at_most(100)
  should validate_length_of(:title_attribute).is_at_most(100)

  def test_has_closure_tree
    assert Optimadmin::MenuItem.methods.include?(:has_closure_tree)
  end
end
