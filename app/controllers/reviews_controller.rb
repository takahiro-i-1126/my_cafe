class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @review = current_user.reviews.build(review_params)
    @review.image.attach(params[:review][:image])
    if @review.save
      flash[:success] = "review created!"
      #店のページに飛ぶよう改良必要
      redirect_to current_user
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def review_params
      params.require(:review).permit(:store_id, :content, :image)
  end

  def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end
end
