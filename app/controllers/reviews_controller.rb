class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  def new
      @review = Review.new 
  end

  def create
      @review = Review.new(review_params)
      @review.restaurant = @restaurant
       if    @review.save
          redirect_to restaurant_path(@restaurant)
       else   
          render :new
      end
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy

      respond_to do |format|
        format.html { redirect_to restaurant_path(@review.restaurant), status: :see_other, notice: 'Review was successfully destroyed.' }
      end
      
  end
  
  private 
  def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
      params.require(:review).permit(:content)
  end
end
