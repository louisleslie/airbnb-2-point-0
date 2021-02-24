class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :destroy, :update]

  def new # Louis
  end

  def create # Louis
  end

  def show # Yunus
  end

  def edit # Alex
  end

  def update # Alex
  end

  def index # Jake
  end

  def destroy # Yunus
    @booking.destroy
    redirect_to :index
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:start_date, :end_date, :total_cost, :price_per_night, :number_of_guests, :status)
  end
end
