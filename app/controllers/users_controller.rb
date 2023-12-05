class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash.clear
  
    if User.exists?(email: @user.email)
      @user.errors.add(:email, 'has already been taken')
      flash.now[:danger] = 'Email is already in use. Please choose a different one.'
    elsif @user.password != @user.password_confirmation
      @user.errors.add(:password_confirmation, "doesn't match Password")
      flash.now[:danger] = 'Password confirmation does not match the password.'
    elsif @user.save
      flash[:success] = 'User was successfully created. Please log in.'
      redirect_to login_path
      return
    else
      flash.now[:danger] = 'User creation failed. Please check the errors below.'
    end
  
    render :new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def require_login
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
end

class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end