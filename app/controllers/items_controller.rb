class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create]
  def index
    @items = Item.all
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

    private
    def item_params
      params.require(:item).permit(:name, :image, :explanation, :category_id, :situation_id, :delivery_charge_id, :shopping_area_id, :number_of_days_until_shopping_id, :price).merge(user_id: current_user.id)
    end
  

end