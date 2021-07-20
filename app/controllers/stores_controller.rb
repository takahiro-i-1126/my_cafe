class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def show
    @store = Store.find(params[:id])
    @review = current_user.reviews.build if logged_in?
    @reviews = @store.reviews.paginate(page: params[:page])
  end

def create
    @store = Store.new(store_params)    # 実装は終わっていないことに注意!
    if @store.save
      # 保存の成功をここで扱う。
    else
      render 'new'
    end
  end

  private

    def store_params
      params.require(:store).permit(:name, :title, :introduction)
    end
end
