class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.name = @property.name.capitalize
    @property.save # TODO swap for if statment when show page is made
    # if @property.save
    #   redirect_to property_path(@property)
    # else
    #   render :new
    # end
  end

  def show
  end

  def index
  end

  private

  def property_params
    params.require(:property).permit(:property_type, :total_occupancy, :total_bedrooms, :total_bathrooms,
                                     :summary, :price_per_night, :has_tv, :has_kitchen, :has_aircon,
                                     :has_heating, :has_internet, :address)
  end
end
