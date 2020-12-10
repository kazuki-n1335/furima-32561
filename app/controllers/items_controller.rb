class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
  
  def createitem
    @item = Item.new(prototypes_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  #item_paramsのpermit内に:imageも必ず記入
  private

  def message_params
    params.require(:item).permit(:name, :introduce, :category_id, :item_status_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id, :value, :image).merge(user_id: current_user.id)
  end
end
