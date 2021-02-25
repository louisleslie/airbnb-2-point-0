class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.where(user_id: current_user.id)
  end

  def create
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.property = Property.find(params[:property_id])
    if @favourite.save
      flash.now[:notice] = "Added #{@favourite.property.name} to your favourites!"
    else
      flash.now[:alert] = "Error adding #{@favourite.property.name} to your favourites!"
    end
  end
  
  def destroy
    @favourite = Favourite.where(property_id: params[:id], user_id: current_user.id).first
    @favourite.destroy
    if @favourite.destroyed?
      flash.now[:notice] = "Removed #{@favourite.property.name} from your favourites!"
    else
      flash.now[:alert] = "Error removing #{@favourite.property.name} from your favourites!"
    end
  end


end
