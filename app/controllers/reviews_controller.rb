class ReviewsController < ApplicationController
  def create
    @goat = Goat.find(params[:goat_id])
    @rental = Rental.find(params[:rental_id])
    @review = Review.new(review_params)
    @review.rental = @rental
    @review.save
    if @review.save
      redirect_to user_path(@review.rental.user)
    else
      redirect_to user_path(@review.rental.user)
    end
  end

  private


  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
