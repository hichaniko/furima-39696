class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [ :show, :edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
    if current_user == @item.user && !@item.order.present?
    else
      redirect_to root_path
    end 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user == item.user  
      item.destroy
    end 
    
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:productname, :image, :category_id, :condition_id, :derivary_charge_id, :prefecture_id, :delivery_day_id,:explanation,:selling_price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  

end
