class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :destroy, :update]
  def edit # no need to write anything inside due to before action
    @booking = @review.booking
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking =  @booking
    @review.property = @booking.property
    if @review.save
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def update
    @booking = @review.booking
    @review.update(review_params)
    redirect_to booking_path(@booking)
  end
  
  def destroy 
    @booking = @review.booking
    @review.destroy
    redirect_to booking_path(@booking)
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
