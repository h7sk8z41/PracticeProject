class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), status: 303
    else
      flash[:notice] = "you can't delete comments that aren't yours"
    end
    redirect_to post_path(@post), status: 303
    end


private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
