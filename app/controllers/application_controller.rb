class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
  { locale: I18n.locale }.merge options
  end

  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersessionsHelper

  def clean_useless_session
    session.delete(:customer)
    session.delete(:customer_id)
    session.delete(:restaurant)
    session.delete(:hall)
    session.delete(:table)
    session.delete(:reservation_id)
  end
end
