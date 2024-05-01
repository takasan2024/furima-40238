class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create]
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
    #@category_parent = Category.where(ancestry: nil)
  end
      # 親カテゴリーが選択された後に動くアクション
    #def get_category_child
      #@category_child = Category.find("#{params[:parent_id]}").children
      #render json: @category_child
      #親カテゴリーに紐付く子カテゴリーを取得
    #end
      # 子カテゴリーが選択された後に動くアクション
    #def get_category_grandchild
      #@category_grandchild = Category.find("#{params[:child_id]}").children
      #render json: @category_grandchild
      #子カテゴリーに紐付く孫カテゴリーの配列を取得
    #end


  
    def create
      @items = Item.new(item_params)
      if @items.save
        redirect_to "/"
      else
        render :new
      end
    end

    private
    def item_params
      params.require(:item).permit(:name, :image, :explanation, :category_id, :situation_id, :delivery_charge_id, :shopping_area_id, :number_of_days_until_shopping_id, :price, images: []).merge(user_id: current_user.id)
    end
  

end