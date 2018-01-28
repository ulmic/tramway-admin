require 'tramway/admin/record_routes_helper'
require "tramway/admin/engine"
require "tramway/user"
require 'font-awesome-rails'

module Tramway
  module Admin
    ::Tramway::User.layout_path = 'tramway/admin/application'
    
    class << self
      def available_models=(models)
        @available_models = models
      end

      def available_models
        @available_models
      end

      def singleton_models=(models)
        @singleton_models = models
      end

      def singleton_models
        @singleton_models
      end
    end
  end
end
