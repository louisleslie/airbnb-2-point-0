class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit]
  def edit # no need to write anything inside due to before action
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id =  params[:booking_id]
    @review.property_id = params[:property_id]
    @Booking = Booking.find(params[:booking_id])
    if @review.save
      redirect_to booking_path(@booking)
    else
      render "booking/show"
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end
  
  def destroy 
    @review.destroy
    redirect_to booking_path #I am now sure about this we should disscuss.
  end

  private
  def set_review
    @review = Review.find(params[:id])

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
