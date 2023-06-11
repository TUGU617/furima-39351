require 'payjp'
class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
<<<<<<< Updated upstream
    @purchase_shipping = PurchaseShipping.new
    if @item.purchase_record.present? && current_user != @item.user 
      redirect_to root_path
    elsif current_user == @item.user
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_shipping.save
      redirect_to items_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
=======
  end

  def new
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
  end

  def create
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_params)
    if @purchase_record_shipping_address.valid?
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record).permit(:item_id, :post_code, :prefecture_id, :municipalities, :address, :building_name, :number).merge(user_id: current_user.id)
  end

>>>>>>> Stashed changes
end
