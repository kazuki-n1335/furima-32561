class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
