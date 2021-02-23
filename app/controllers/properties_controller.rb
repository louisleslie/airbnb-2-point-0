class PropertiesController < ApplicationController
  def new
  end

  def show
    @property = Property.find(params[:id])
  end

  def index
  end
end
