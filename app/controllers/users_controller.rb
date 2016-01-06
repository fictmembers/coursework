class UsersController < ApplicationController
  before_action :signed_in_user, only:   [:show, :edit, :update]
  before_action :correct_user, only:     [:edit, :update, :index, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in_user @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to controlpanel_path
  end

  private def user_params
    params.require(:user).permit(:lastname, :email, :photo, :password, :password_confirmation)
  end

  def signed_in_user
    redirect_to user_signin_path unless signed_in_user? || signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_signin_path unless current_user?(@user) || signed_in?
  end
end
