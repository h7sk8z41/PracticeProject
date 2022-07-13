class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]
  def create
    @post = Post.find(params[:post_id])
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

    def destroy
      if !(already_liked?)
        flash[:notice] = "Cannot unlike"
      else
        @like.destroy
      end
      redirect_to post_path(@post)
    end

  private
   def already_liked?
      Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
   end
    def find_like
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
    end
end
