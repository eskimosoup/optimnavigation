module Optimadmin
   class StaticPagesController < ApplicationController
    load_and_authorize_resource
    before_action :set_static_page, only: [:edit, :update, :destroy]

    # GET /static_pages
    # GET /static_pages.json
    def index
      @static_pages = StaticPage.all
    end

    # GET /static_pages/new
    def new
      @static_page = StaticPage.new
    end

    # GET /static_pages/1/edit
    def edit
    end

     # POST /static_pages
     # POST /static_pages.json
     def create
       @static_page = StaticPage.new(static_page_params)

      if @static_page.save
        respond_to do |format|
          format.html { redirect_to static_pages_url, notice: 'Static page was successfully created.' }
          format.js {
            @static_page = StaticPage.new
            flash[:notice] = 'Static page was successfully created.'
            render :success
            flash.clear
          }
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.js
        end
      end
   end

    # PATCH/PUT /static_pages/1
    # PATCH/PUT /static_pages/1.json
    def update
      if @static_page.update(static_page_params)
        redirect_to static_pages_url, notice: 'Static page was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /static_pages/1
    # DELETE /static_pages/1.json
    def destroy
      @static_page.destroy
      redirect_to static_pages_url, notice: 'Static page was successfully destroyed.'
    end

     private
      # Use callbacks to share common setup or constraints between actions.
      def set_static_page
        @static_page = StaticPage.find(params[:id])
      end


       # Never trust parameters from the scary internet, only allow the white list through.
       def static_page_params
         params.require(:static_page).permit(:name, :route)
      end
  end
end
