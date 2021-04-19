class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    def show
      @item = Item.find(params[:id])
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :category_id, :information, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
