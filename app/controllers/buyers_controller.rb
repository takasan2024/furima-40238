class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @items = Item.find(params[:item_id])
    @buyer_address_information = BuyerAddressInformation.new
  end

  def create
    @buyer_address_information = BuyerAddressInformation.new(buyer_params)
    if @buyer_address_information.valid?
      pay_item
      @buyer_address_information.save(params,current_user.id)
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @items = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buyer_params
    params.require(:buyer_address_information).permit(:post_code, :shopping_area_id, :municipalities, :street_address, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: Item.find(params[:item_id]).price,  # 商品の値段
    card: buyer_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
    )
    end
    def non_purchased_item
      @items = Item.find(params[:item_id])
      redirect_to root_path if current_user.id == @items.user_id || @items.buyer.present?
    end
end