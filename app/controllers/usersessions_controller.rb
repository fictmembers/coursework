class UsersessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      clean_useless_session
      sign_in_user user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out_user
    clean_useless_session
    redirect_to root_path
  end
end
