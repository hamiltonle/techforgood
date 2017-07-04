class UsersController < ApplicationController
  # Devise authentication exceptions for the following pages:
  skip_before_action :authenticate_user!, only: [:index, :show]

  # Devise: whitelist all pages for testing
  # skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

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

    redirect_to (dashboard_users_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
  end

  def dashboard
    # Add instance variables which will be used in the user dashboard
    @user = current_user
    @courses = @user.courses
    @new_user = @courses.count == 0
    @completed_enrollments = @user.enrollments.where(:status => "completed")
    @current_enrollments = @user.enrollments.where(:status => nil)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :group, :photo)
  end
end
