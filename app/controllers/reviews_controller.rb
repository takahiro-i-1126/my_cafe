class ReviewsController < ApplicationController

  def index
    @reviews = Review.paginate(page: params[:page])
  end

end
