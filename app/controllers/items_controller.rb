class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:destroy]
  before_action :set_item, only:[:show, :edit]
  before_action :move_to_index, except: [:index,:show ]
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
  end

  def show
  end

 def destroy
    item = Item.find(params[:id])
   if item.destroy
    redirect_to action: :index
    end
 end
 def edit

 end
 def update
  item = Item.find(params[:id])
  item.update(item_params)
 end

  private

  def item_params
    params.require(:item).permit(:product, :category_id, :information, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
