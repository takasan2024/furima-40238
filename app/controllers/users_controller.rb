class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  def index
    @users = User.includes(:user)
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
    
  end
