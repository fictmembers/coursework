class UsersController < ApplicationController
  before_action :signed_in_user, only:   [:show, :edit, :update]
  before_action :correct_user, only:     [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @customer = Customer.new(lastname: @user.lastname)

    @customer.save
    @user.customer_id = @customer.id

    if @user.save
      sign_in_user @user
      session[:customer] = @user.lastname
      session[:customer_id] = @user.customer_id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where('customer_id = ?', @user.customer_id).paginate(page: params[:orders_page], per_page: 5)
    @reservations = Reservation.where('customer_id = ?', @user.customer_id).paginate(page: params[:reservation_page], per_page: 2)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @customer = Customer.find(@user.customer_id)
    if @user.update_attributes(user_params)
      @customer.update_attributes(lastname: @user.lastname)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    clean_useless_session
    redirect_to root_path
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
