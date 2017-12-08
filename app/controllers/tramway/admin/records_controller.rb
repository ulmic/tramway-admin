require_dependency "tramway/admin/application_controller"

module Tramway::Admin
  class RecordsController < ApplicationController
    def index
      @records = params[:model].constantize.all
    end
  end
end
