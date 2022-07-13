class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
  end

  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other
    end
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end
