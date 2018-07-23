class ReviewsController < ApplicationController
  def create
    product = params[:product_id]
    @review = Review.new(review_params)
    @review.product_id = product
    @review.user = current_user
    if @review.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def destroy
    puts params
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
