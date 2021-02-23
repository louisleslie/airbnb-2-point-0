class BookingsController < ApplicationController
  
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
    @bookings = current_user.bookings
  end

  def destroy # Yunus
  end 
end
