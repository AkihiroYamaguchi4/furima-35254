class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
   @item = Item.find(params[:item_id])
   @puchase_shipping = PurchaseShipping.new
  end

 def create
  @puchase_shipping = PurchaseShippig.new(purchase_params)
  Shipping.create(shipping_params)
  if @puchase_shipping.valid?
    pay_item
    @puchase_shipping.save
    return redirect_to root_path
  else
    render 'index'
  end
 end

 private
 def purchase_params
  params.require(:purchase_shipping).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: purchase_shipping_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
 end
end
