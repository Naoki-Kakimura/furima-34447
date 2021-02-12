class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :item_find, only: [:show,:edit,:update,:destroy]
  before_action :check_user, only: [:edit,:update,:destroy]
  def index
    @items = Item.order("created_at DESC")
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
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:text,:category_id,:status_id,:shipping_charge_id,:shipping_day_id,:prefecture_id,:price).merge(user_id: current_user.id)
  end
  def item_find
    @item = Item.find(params[:id])
  end
  def check_user
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
