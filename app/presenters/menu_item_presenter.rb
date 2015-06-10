class MenuItemPresenter

  attr_reader :menu_item, :link, :menu_resource, :template
  def initialize(menu_item, template)
    @menu_item = menu_item
    @link = menu_item.link
    @menu_resource = @link.menu_resource
    @template = template
  end

  def list_item(menu_item_children)
    return nil if destination.nil?
    h.render partial: 'menu_items/menu_list_item', locals: { menu_item_presenter: self, menu_item_children: menu_item_children }
  end

  def link_to_webpage
    return nil if destination.nil?
    h.link_to name, destination, title: title_attribute
  end

  def classes
    classes = []
    classes << "active" if active?
    classes.join(' ')
  end

  def active?
    h.current_page?(destination) || active_decendants?
  end

  private

  def h
    @template
  end

  def descendants
    menu_item.descendants.map{|x| self.class.new(x, template) }
  end

  def active_decendants?
    descendants.map(&:active?).any?{|x| x == true }
  end

  def name
    menu_item.name
  end

  def title_attribute
    menu_item.title_attribute
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
end