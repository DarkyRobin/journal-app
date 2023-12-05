class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||=
      begin
        return nil unless session[:user_id]

        User.find(session[:user_id])
      end
  end
end
