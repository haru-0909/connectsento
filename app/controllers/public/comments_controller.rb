class Public::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
     redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      redirect_back(fallback_location: root_path)
    else
      render "records/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end



end
