module Optimadmin
  class MenuItemsController < ApplicationController

    before_action :set_menu_item, only: [:edit, :update, :destroy]

    def index
      @menus = Menu.build_collection
    end

    def new
      @menu_item = MenuItem.new(menu_name: params[:menu_name])
      @menu_items = MenuItem.where(menu_name: params[:menu_name]).pluck(:name, :id)
    end

    def create
      @menu_item = MenuItem.new(menu_item_params)
      if @menu_item.save
        redirect_to menu_items_path, notice: "Successfully created menu item"
      else
        @menu_items = MenuItem.where(menu_name: @menu_item.menu_name).pluck(:name, :id)
        render :new
      end
    end

    def edit
      @menu_items = MenuItem.where(menu_name: @menu_item.menu_name).where.not(id: @menu_item.id).pluck(:name, :id)
    end

    def update
      if @menu_item.update(menu_item_params)
        redirect_to menu_items_path, notice: "Successfully created menu item"
      else
        @menu_items = MenuItem.where(menu_name: @menu_item.menu_name).where.not(id: @menu_item.id).pluck(:name, :id)
        render :edit
      end
    end

    def reorder
      @menus = Menu.build_collection
    end

    def order      
      params[:item].each_with_index do |id, index|
      	MenuItem.find(id).update_attribute(:position, index)
    	end

    	# Since the positions are being changed during the previous loop the positions depth cache
    	# calculates wrong. A second pass fixes this but there should be a better way.
    	MenuItem.all.each do |x|
    	  x.save
    	end

	    render :nothing => true
    end

    private

    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    def menu_item_params
      params.require(:menu_item).permit(:menu_name, :name, :parent_id, :anchored, :new_window, :title_attribute)
    end

  end
end
