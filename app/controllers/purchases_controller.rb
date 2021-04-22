class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_index, only: :index
  def index
    @puchase_shipping = PurchaseShipping.new
  end

  def create
    @puchase_shipping = PurchaseShipping.new(purchase_params)
    if @puchase_shipping.valid?
      pay_item
      @puchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).selling_price,
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
end
