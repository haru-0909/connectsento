class Public::RelationshipsController < ApplicationController

  def create
    #byebug
    current_user.follow(params[:user_id])
    #follow.save
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
end
