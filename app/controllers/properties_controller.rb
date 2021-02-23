class PropertiesController < ApplicationController
  before_action :set_property

  def index
    @properties = Property.all
  end

  def edit
  end

  def update
    @property.update(property_params)
    redirect_to property_path(@property)
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:longitude, :address, :latitude, :has_internet, :has_heating, :has_aircon, :has_kitchen, :has_tv, :price_per_night, :summary, :total_bathrooms, :total_bedrooms, :total_occupancy, :property_type)
  end
end
