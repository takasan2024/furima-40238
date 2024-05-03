class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create, :show]
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
      @items = Item.find(params[:id])
      if @items.user_id != current_user.id
        redirect_to root_path
      end
    end

    def edit
      @items = Item.find(params[:id])
    end

    def update
      @items = Item.find(params[:id])
     if @items.update(item_params)
      redirect_to item_path
     else
        render :edit, status: :unprocessable_entity
      end
    end

    private
    def item_params
      params.require(:item).permit(:name, :image, :explanation, :category_id, :situation_id, :delivery_charge_id, :shopping_area_id, :number_of_days_until_shopping_id, :price).merge(user_id: current_user.id)
    end
  

end