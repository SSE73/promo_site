class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # layout "layout_blog"

  def index
    # @posts = Post.all
    @posts = Post.page(params[:page]).per(4)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user != 0
    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      flash.now[:danger] = 'Статья не создана'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Статья успешно обновлена'
    else
      flash.now[:danger] = 'Статья не обновлена'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Статья успешно удалена'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:body,:user_id)
  end

end