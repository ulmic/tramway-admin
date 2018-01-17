require 'tramway/admin/record_routes_helper'

module Tramway::Admin
  class RecordsController < ApplicationController
    include ::Tramway::Admin::RecordRoutesHelper

    def index
      @records = decorator_class.decorate model_class.active.send(params[:scope] || :all).page params[:page]
    end

    def show
      @record = decorator_class.decorate model_class.active.find params[:id]
    end

    def edit
      @record_form = form_class.new model_class.active.find params[:id]
    end

    def update
      @record_form = form_class.new model_class.active.find params[:id]
      if @record_form.submit params[:record]
        redirect_to params[:redirect] || record_path(@record_form.model)
      else
        render :edit
      end
    end

    def new
      @record_form = form_class.new model_class.new
    end

    def create
      @record_form = form_class.new model_class.new
      if @record_form.submit params[:record]
        redirect_to params[:redirect] || record_path(@record_form.model)
      else
        render :new
      end
    end

    def destroy
      record = model_class.active.find params[:id]
      record.remove
      redirect_to records_path
    end
  end
end
