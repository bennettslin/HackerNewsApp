class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    current_user.comments << @comment

    if @comment.save
      flash[:success] = "Comment successful."
    else
      flash[:danger] = "Comment was not created."
    end
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end