class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :destroy] 
  
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.name = @property.name.capitalize
    @property.user = current_user
    raise
    @property.save # TODO swap for if statment when show page is made
    # if @property.save
    #   redirect_to property_path(@property)
    # else
    #   render :new
    # end
  end
  def show
  end

  def destroy
    @property.destroy
    redirect_to :index
  end

  def users_index
    @properties = current_user.properties
    redirect_to user_index(@properties)
  end

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
    params.require(:property).permit(:name, :property_type, :total_occupancy, :total_bedrooms, :total_bathrooms,
                                     :summary, :price_per_night, :has_tv, :has_kitchen, :has_aircon,
                                     :has_heating, :has_internet, :address, photos: [])
  end
end
