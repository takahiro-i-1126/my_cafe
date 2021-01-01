class StoresController < ApplicationController
  def new
  end

  def show
    @store = Store.find(params[:id])
    @review = current_user.reviews.build if logged_in?
    @reviews = @store.reviews.paginate(page: params[:page])
  end
end
