require "tramway/admin/engine"
require "tramway/user"

module Tramway
  module Admin
    ::Tramway::User.layout_path = 'tramway/admin/application'
  end
end
