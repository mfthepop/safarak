class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "دوست اضافه شد"
      redirect_to User.find(params[:friend_id]).profile
    else
      flash[:notice] = "Unable to add friend."
      redirect_to User.find(params[:friend_id]).profile
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user.profile
  end

  def friend_params
    redirect_to params.require(:friendship).permit(:friend_id)
  end


end


