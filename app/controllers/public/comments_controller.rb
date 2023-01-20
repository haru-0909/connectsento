class Public::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id)
    else
      redirect_to post_path(@post.id)
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:comment, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end



end
