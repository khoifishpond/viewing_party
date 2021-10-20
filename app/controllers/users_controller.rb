class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    new_user = User.create(user)
    session[:user_id] = new_user.id
    flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to dashboard_index_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
