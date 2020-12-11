class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: :index

  def index
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

  private

  def item_params
    params.require(:item).permit(:name, :introduce, :category_id, :item_status_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :value, :image).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
