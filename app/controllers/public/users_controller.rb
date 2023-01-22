class Public::UsersController < ApplicationController
  before_action :set_user, only: [:followings, :followers]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def follows
    @users = @user.follows
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
