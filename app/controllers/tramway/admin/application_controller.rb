module Tramway
  module Admin
    class ApplicationController < ActionController::Base
      include AuthManagment
      before_action :authenticate_admin!

      protect_from_forgery with: :exception
    end
  end
end
