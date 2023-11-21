class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(updated_at: :DESC)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(get_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity #statusはrails7のみ
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(get_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def find
    @posts = Post.where("title like ? or explanations like ?","%#{params[:text]}%", "%#{params[:text]}%")
    render :index
  end

  private
  def get_params
    params.require(:post).permit(:title, :user_id, :explanations)
  end
end
