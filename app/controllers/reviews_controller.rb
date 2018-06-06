require 'pry'
class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    # binding.
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create

    
    @review = Review.new(review_params)

      # we need `restaurant_id` to asssociate review with corresponding restaurant
      @review.restaurant = Restaurant.find(params[:restaurant_id])
    #   binding.pry
      if @review.save
        redirect_to restaurant_path(@review.restaurant)
      else
        render :new
      end

    # respond_to do |format|
    #     if @review.save
    #       format.html { redirect_to @review, notice: 'Review was successfully created.' }
    #       format.json { render :show, status: :created, location: @review }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @review.errors, status: :unprocessable_entity }
    #     end
    #   end
  
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

