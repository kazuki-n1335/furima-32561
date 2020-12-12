class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    @item.valid?
    if current_user.id == @item.user_id
      @item.update(item_params)
      if @item.save
        redirect_to item_path(@item.id)
      else
        render :edit
      end
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduce, :category_id, :item_status_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :value, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
