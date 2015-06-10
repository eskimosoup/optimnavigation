module Optimadmin
  class MenuItemsController < ApplicationController
    #load_and_authorize_resource

    before_action :set_menu_item, only: [:edit, :update, :destroy]
    before_action :new_static_page, only: [:new, :create, :edit, :update]
    before_action :link_resources, only: [:edit, :update]

    def index
      @menus = Menu.build_collection
    end

    def new
      @menu_item = MenuItem.new(menu_name: params[:menu_name])
      @menu_item.build_link
      @menu_items = MenuItem.where(menu_name: params[:menu_name]).pluck(:name, :id)
    end

    def create
      @menu_item = MenuItem.new(menu_item_params)
      if @menu_item.save
        redirect_to menu_items_path, notice: "Successfully created menu item"
      else
        @link_resources = FindLinkResources.new(@menu_item.link.resource_type).call
        @menu_items = MenuItem.where(menu_name: @menu_item.menu_name).pluck(:name, :id)
        render :new
      end
    end

    def edit
      @menu_items = MenuItem.where(menu_name: @menu_item.menu_name).where.not(id: @menu_item.id).pluck(:name, :id)
      @menu_item.build_link if @menu_item.link.blank?
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
      render nothing: true
    end

    def update_link_resources
      @link_resources = FindLinkResources.new(params[:klass]).call
      respond_to do |format|
        format.js
      end
    end

    def destroy
      @menu_item.destroy
      redirect_to menu_items_url, notice: 'Menu item was successfully destroyed.'
    end

    private

      def set_menu_item
        @menu_item = MenuItem.find(params[:id])
      end

      def new_static_page
        @static_page = StaticPage.new
        @external_link = ExternalLink.new
      end

      def menu_item_params
        params.require(:menu_item).permit(:menu_name, :name, :parent_id, :anchored, :new_window, :title_attribute, link_attributes: [ :resource_type, :resource_id, :menu_item_id ])
      end

      def link_resources
        @link_resources = FindLinkResources.new(params[:klass]).call
      end

  end
end
