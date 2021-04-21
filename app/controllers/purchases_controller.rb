class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
   @item = Item.new
   @puchase_shipping = PurchaseShipping.new
  end

 def create
  binding.pry
  @puchase_shipping = PurchaseShippig.new(purchase_params)
  Shipping.create(shipping_params)
 end

 private
 def purchase_params
  params.permit(:token).merge(user_id: current_user.id, item_id: params[:item_id])
 end
end
