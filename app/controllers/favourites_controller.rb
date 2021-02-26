class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.select("property_id").where(user_id: current_user.id)
    
    @properties = Property.where(id: @favourites)
    
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { property: property }),
        image_url: helpers.asset_path("map-pin.svg")
      }
    end
    render 'properties/index'
  end

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.property = Property.find(params[:property_id])
    @favourite.save
  end
  
  def destroy
    @favourite = Favourite.where(property_id: params[:id], user_id: current_user.id).first
    @favourite.destroy
  end


end
