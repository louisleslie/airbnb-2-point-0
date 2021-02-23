class PropertiesController < ApplicationController
  
  def index
  end

  def new
  end

  def show
    @property = Property.find(params[:id])
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to :index
  end

end
