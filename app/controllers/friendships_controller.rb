class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:search])
    friendship = Friendship.find_by(user: current_user, friend: friend)
    if friend && friend.email == current_user.email
      flash[:error] = "Please enter a valid email address."
    elsif friend && friendship.nil?
      current_user.friendships.create(friend_id: friend.id)
      flash[:success] = "Friendship successfully created."
    elsif friend && friendship
      flash[:error] = "You cannot add that friend twice. Please try again."
    else
      flash[:error] = "That user does not exist. Please try again."
    end
    redirect_to '/dashboard'
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
