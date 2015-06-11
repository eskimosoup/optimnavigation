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
      @menu_items ||= MenuItem.includes(link: :menu_resource).where(menu_name: name).hash_tree
    end

    def no_hash_tree_items
      @no_hash_tree ||= MenuItem.includes(link: :menu_resource).where(menu_name: name)
    end

    def self.build_collection
      NavigationMenus.map do |navigation_menu|
        Menu.new(name: navigation_menu)
      end
    end
  end
end
