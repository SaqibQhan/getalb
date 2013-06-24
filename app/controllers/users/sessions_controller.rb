class Users::SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, :only => [:new, :create]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    puts "YYYYYYYYYYYYYYYYYYYYYYYYYYY"
    puts "YYYYYYYYYYYYYYYYYYYYYYYYYYY"
    puts "YYYYYYYYYYYYYYYYYYYYYYYYYYY"
    puts "YYYYYYYYYYYYYYYYYYYYYYYYYYY"
    puts "YYYYYYYYYYYYYYYYYYYYYYYYYYY", session[:user_id].inspect
    session[:user_id] = user.id
    redirect_to root_url
  end

end
