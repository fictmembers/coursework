module SessionsHelper
  def sign_in(administrator)
    remember_token = Administrator.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    administrator.update_attribute(:remember_token, Administrator.encrypt(remember_token))
    self.current_administrator = administrator
  end

  def sign_out
    current_administrator.update_attribute(:remember_token,
                                  Administrator.encrypt(Administrator.new_remember_token))
    cookies.delete(:remember_token)
    self.current_administrator = nil
  end

  def current_administrator=(administrator)
    @current_administrator = administrator
  end

  def current_administrator
    remember_token = Administrator.encrypt(cookies[:remember_token])
    @current_administrator ||= Administrator.find_by(remember_token: remember_token)
  end

  def current_administrator?(administrator)
    administrator == current_administrator
  end

  def signed_in?
    !current_administrator.nil?
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
