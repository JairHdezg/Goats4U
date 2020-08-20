class ReviewsController < ApplicationController
  def create
    @goat = Goat.find(params[:id])
    @review = Review.new(review_params)
    @review.goat = @goat
    if @review.save
      redirect_to goat_path(@goat)
    else
      render "goats/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
