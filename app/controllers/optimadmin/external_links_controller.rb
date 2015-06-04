module Optimadmin
  class ExternalLinksController < ApplicationController
    load_and_authorize_resource
    
    before_action :set_external_link, only: [:edit, :update, :destroy]

    # GET /external_links
    # GET /external_links.json
    def index
      @external_links = ExternalLink.all
    end

    # GET /external_links/new
    def new
      @external_link = ExternalLink.new
    end

    # GET /external_links/1/edit
    def edit
    end

    # POST /external_links
    # POST /external_links.json
    def create
      @external_link = ExternalLink.new(external_link_params)


        if @external_link.save
          redirect_to @external_link, notice: 'External link was successfully created.'
        else
          render :new
        end

    end

    # PATCH/PUT /external_links/1
    # PATCH/PUT /external_links/1.json
    def update

        if @external_link.update(external_link_params)
          redirect_to @external_link, notice: 'External link was successfully updated.'
        else
          render :edit
        end

    end

    # DELETE /external_links/1
    # DELETE /external_links/1.json
    def destroy
      @external_link.destroy
      redirect_to external_links_url, notice: 'External link was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_external_link
        @external_link = ExternalLink.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def external_link_params
        params.require(:external_link).permit(:url)
      end
  end
end
