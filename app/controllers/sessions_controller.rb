class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session].present? && params[:session][:email].present? && params[:session][:password].present?
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to dashboard_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    else
      flash.now[:danger] = 'Email and password are required'
      render 'new'
    end
  end

  def destroy
    # Log the user out and redirect to the home page
    log_out
    redirect_to root_url
  end
end
