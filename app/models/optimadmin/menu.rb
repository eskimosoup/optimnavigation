module Optimadmin
  class Menu

    attr_reader :name

    def initialize(name:)
      @name = name
    end

    def humanized_name
      name.humanize
    end

    def menu_items
      @menu_items ||= MenuItem.where(menu_name: name).hash_tree
    end

    def self.build_collection
      NavigationMenus.map do |navigation_menu|
        Menu.new(name: navigation_menu)
      end
    end
  end
end
