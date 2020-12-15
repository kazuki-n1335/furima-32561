class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root_path
  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']   # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.value, # 商品の値段
        card: order_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:post_number, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_root_path
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
end
