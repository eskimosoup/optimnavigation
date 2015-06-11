module Optimadmin
  class ApplicationController < ActionController::Base

    before_action :global_site_settings, :authorize

    def index
      # redirect_to optimnav_branches_path
    end

    def link_list
      respond_to do |format|
        format.js {
          render :layout => nil
        }
      end
    end


    private

      def current_administrator
        @current_administrator ||= Administrator.find_by(auth_token: cookies[cookie_name]) if cookies[cookie_name]
      end
      helper_method :current_administrator

      def authorize
        session[cookie_name_return_to] = request.fullpath
        redirect_to login_url, alert: 'Not authorised' if current_administrator.nil?
      end

      def global_site_settings
        @global_site_settings ||= SiteSetting.current_environment
      end
      helper_method :global_site_settings

      def cookie_name
        global_site_settings['Name'] ? "#{global_site_settings['Name'].downcase.gsub(' ', '_').first(10)}_auth_token" : 'optimadmin_auth_token'
      end

      def cookie_name_return_to
        "#{cookie_name}_return_to"
      end

      # needs to be defined to use cancancan in engine
      def current_ability
        @current_ability ||= AdminAbility.new(current_administrator)
      end

    rescue_from CanCan::AccessDenied do |exception|
      logger.info exception
      flash[:error] = 'Access denied!'
      redirect_to root_url
    end
  end
end
