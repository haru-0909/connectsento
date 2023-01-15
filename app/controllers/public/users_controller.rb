class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_params
      params.require(:user).permit(:name, :caption, :profile_image)
  end
end
