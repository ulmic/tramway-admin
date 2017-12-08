module Tramway
  module Admin
    class ApplicationController < ActionController::Base
      include AuthManagment
      before_action :authenticate_admin!
      before_action :check_available!
      before_action :collections_counts

      protect_from_forgery with: :exception

      def check_available!
        render '/404' unless params[:model].in? ::Tramway::Admin.available_models.map(&:to_s)
      end

      def collections_counts
        @counts = "#{params[:model]}Decorator".constantize.collections.reduce({}) do |hash, collection|
          hash.merge! collection => params[:model].constantize.send(collection).count
        end
      end
    end
  end
end
