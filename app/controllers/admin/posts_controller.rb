class Admin::PostsController < ApplicationController

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :caption, :image, :address, :latitude, :longitude)
  end


end
