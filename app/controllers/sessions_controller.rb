class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_index_path
      flash[:success] = "Welcome, #{user.username}!"
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to :login_form
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end
end
