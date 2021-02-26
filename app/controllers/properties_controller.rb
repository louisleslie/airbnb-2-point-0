class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.name = @property.name.capitalize
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  def users_index
    @properties = current_user.properties
  end

  def index
    @search_success = true
    unless @properties
      if params[:query].present?
        coordinates = Geocoder.search(params[:query]).first.coordinates
        @properties = Property.near(coordinates, 50)
        if @properties.empty?
          @search_success = false
          @properties = Property.all
        end
      else
        @properties = Property.all
      end
    end
    
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { property: property }),
        image_url: helpers.asset_path("map-pin.svg")
      }
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property)
    else
      render :edit
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :property_type, :total_occupancy, :total_bedrooms, :total_bathrooms,
     :summary, :price_per_night, :has_tv, :has_kitchen, :has_aircon,
     :has_heating, :has_internet, :address, photos: [])
  end
end
