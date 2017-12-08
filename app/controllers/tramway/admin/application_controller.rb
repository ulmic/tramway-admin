module Tramway
  module Admin
    class ApplicationController < ActionController::Base
      include AuthManagment
      before_action :authenticate_admin!
      before_action :check_available!

      protect_from_forgery with: :exception

      def check_available!
        params[:model].constantize.in? ::Tramway::Admin.available_models
      end
    end
  end
end
