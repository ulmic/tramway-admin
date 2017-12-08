require "tramway/admin/engine"
require "tramway/user"
require 'font-awesome-rails'

module Tramway
  module Admin
    ::Tramway::User.layout_path = 'tramway/admin/application'

    def self.available_models=(models)
      @available_models = models
    end

    def self.available_models
      @available_models
    end
  end
end
