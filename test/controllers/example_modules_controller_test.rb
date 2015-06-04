require 'test_helper'

class ExampleModulesControllerTest < ActionController::TestCase
  setup do
    @example_module = example_modules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:example_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create example_module" do
    assert_difference('ExampleModule.count') do
      post :create, example_module: { text: @example_module.text, title: @example_module.title }
    end

    assert_redirected_to example_module_path(assigns(:example_module))
  end

  test "should show example_module" do
    get :show, id: @example_module
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @example_module
    assert_response :success
  end

  test "should update example_module" do
    patch :update, id: @example_module, example_module: { text: @example_module.text, title: @example_module.title }
    assert_redirected_to example_module_path(assigns(:example_module))
  end

  test "should destroy example_module" do
    assert_difference('ExampleModule.count', -1) do
      delete :destroy, id: @example_module
    end

    assert_redirected_to example_modules_path
  end
end
