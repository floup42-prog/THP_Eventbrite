class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @events = @user.events
    @user.first_name
    @user.last_name
    @user.email
    @user.description
  end

  # def new
  # end

  # def edit
  # end

  # def create
  # end

  # def update
  # end

  def destroy
    @user.destroy
    redirect_to root_path
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).params(:email, :password)
  end
end