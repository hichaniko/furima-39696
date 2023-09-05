class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index ]


  def index
    # @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:productname, :image, :category_id, :condition_id, :derivary_charge_id, :prefecture_id, :delivery_day_id,:explanation,:selling_price ).merge(user_id: current_user.id)
  end

  

end
