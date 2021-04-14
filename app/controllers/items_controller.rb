class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product, :category_id, :information, :condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
