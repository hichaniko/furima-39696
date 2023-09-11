class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :set_item, only:[:index, :create]

  def index
    if current_user != @item.user && !@item.order.present?
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    else
    redirect_to root_path
   end 
  end


  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:address, :prefecture_id, :city, :streetad, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自分のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
