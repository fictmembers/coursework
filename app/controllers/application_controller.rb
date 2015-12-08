class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def clean_session
    session.delete(:restaurant)
    session.delete(:hall)
    session.delete(:table)
  end
end
