module Tramway
  module Admin
    class ApplicationController < ActionController::Base
      include AuthManagment
      before_action :authenticate_admin!
      before_action :check_available!
      before_action :collections_counts, if: :model_given?

      protect_from_forgery with: :exception

      def check_available!
        render '/404' unless model_given?
        if params[:scope].present?
          render '/404' unless available_scope_given?
        end
      end

      def collections_counts
        @counts = "#{params[:model]}Decorator".constantize.collections.reduce({}) do |hash, collection|
          hash.merge! collection => params[:model].constantize.send(collection).count
        end
      end

      def model_class
        params[:model].constantize
      end

      def decorator_class
        "#{model_class}Decorator".constantize
      end

      private

      def model_given?
        params[:model].in? ::Tramway::Admin.available_models.map(&:to_s)
      end

      def available_scope_given?
        params[:scope].present? && params[:scope].in?(decorator_class.collections.map(&:to_s))
      end
    end
  end
end
