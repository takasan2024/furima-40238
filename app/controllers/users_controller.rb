class UsersController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.includes(:user)
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
