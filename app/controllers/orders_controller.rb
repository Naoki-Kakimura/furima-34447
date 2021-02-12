class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order_purchase = OrderPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_purchase = OrderPurchase.new(order_purchase_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :new
    end
  end

  private
  def order_purchase_params
    params.require(:order_purchase).permit(:post_num,:prefecture_id,:municipality,:address,:bill_name,:phone_num).merge(user_id:current_user.id,item_id:params[:item_id])
  end

end
