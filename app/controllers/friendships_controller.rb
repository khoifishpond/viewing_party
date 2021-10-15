class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:search])
    friendship = Friendship.create(user_id: current_user.id, friend_id: friend.id)
    redirect_to '/dashboard'
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
