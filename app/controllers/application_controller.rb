class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def fb_sign_in
    unless user_signed_in?
      #flash[:warning] = "You need to sign in first"
      redirect_to "/"
    end
  end


  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
