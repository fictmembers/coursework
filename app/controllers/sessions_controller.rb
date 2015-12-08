class SessionsController < ApplicationController
  def new
  end

  def create
    administrator = Administrator.find_by(login: params[:session][:login])
    if administrator && administrator.authenticate(params[:session][:password])
      sign_in administrator
      redirect_to administrator
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
