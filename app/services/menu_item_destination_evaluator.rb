class MenuItemDestinationEvaluator

  attr_reader :menu_resource

  def initialize(view_template:, menu_resource:)
    @view_template = view_template
    @menu_resource = menu_resource
  end

  def destination
    case menu_resource
      when Optimadmin::StaticPage
        h.public_send(menu_resource.route) if h.respond_to?(menu_resource.route)
      when Optimadmin::ExternalLink
        menu_resource.name
      else
        nil
    end
  end

  def active?
    h.current_page?(destination)
  end

  private

  def h
    @view_template
  end

end