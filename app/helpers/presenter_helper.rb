module PresenterHelper
  def present(object)
    presenter = object.class.presenter.new(object, self)
    yield presenter if block_given?
    presenter
  end
end