require_dependency "tramway/admin/application_controller"

module Tramway::Admin
  class RecordsController < ApplicationController
    def index
      @records = decorator_class.decorate model_class.send(params[:scope] || :all).page params[:page]
    end

    def edit
      @record_form = form_class.new model_class.find params[:id]
    end

    def update
      @record_form = form_class.new model_class.find params[:id]
      if @record_form.submit params[:record]
        redirect_to params[:redirect] || record_path(@record_form.model)
      else
        render :edit
      end
    end
  end
end
