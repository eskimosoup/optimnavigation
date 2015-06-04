module Optimadmin
  class StaticPagesController < ApplicationController
    load_and_authorize_resource

    # POST /static_pages
    # POST /static_pages.json
    def create
      @static_page = StaticPage.new(static_page_params)

      if @static_page.save
        redirect_to @static_page, notice: 'Static page was successfully created.'
      else
        render :new
      end
    end

    private
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def static_page_params
        params.require(:static_page).permit(:name, :route)
      end
  end
end
