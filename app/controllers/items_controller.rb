class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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

  def item_params
    params.require(:item).permit(:image, :product_name, :description_of_item, :category_id, :product_condition_id,
                                 :shipping_fee_id, :shipping_area_id, :date_of_shipment_id, :price).merge(user_id: current_user.id)
  end
end
