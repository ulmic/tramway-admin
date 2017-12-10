require_dependency "tramway/admin/application_controller"

module Tramway::Admin
  class RecordsController < ApplicationController
    def index
      @records = decorator_class.decorate params[:model].constantize.send(params[:scope] || :all).page params[:page]
    end
  end
end
