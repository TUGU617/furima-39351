class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      puts @item.errors.full_messages # デバッグ出力
      render :new
    end
  end
  private
  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :date_of_shipment_id, :price, :image).merge(user_id: current_user.id)
  end

end
