class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:id])
    @user = User.new(user_params)

    # redirect_to (user dashboard)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    # redirect_to (user dashboard)
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
  end

  def dashboard
    # Add instance varibles which will be used in the user dashboard
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
