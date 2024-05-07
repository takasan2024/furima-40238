class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:edit,:create,:destroy]
  before_action :set_items, only: [:show,:edit,:update,:destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @items = Item.new
  end

    def create
      @items = Item.new(item_params)
      if @items.save
        redirect_to "/"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
    
    end

    def edit
      if @items.user_id == current_user.id && @items.buyer.nil?
      else
        redirect_to root_path
      end
    end

    def update
     if @items.update(item_params)
      redirect_to item_path
     else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @items.user_id == current_user.id
      @items.destroy
    end
      redirect_to root_path
    end

    private
    def item_params
      params.require(:item).permit(:name, :image, :explanation, :category_id, :situation_id, :delivery_charge_id, :shopping_area_id, :number_of_days_until_shopping_id, :price).merge(user_id: current_user.id)
    end
    def set_items
      @items = Item.find(params[:id])
    end

end