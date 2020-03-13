class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def show
    id = params[:id]
    @comment = Comment.new
    @post = Post.find_by(id: id)
    @comments = @post.comments.order("created_at DESC")
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    # @post.image.attach(params[:image])
    
    if @post.save
      flash.now[:notice] = 'Message sent!'
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Error while uploading image!'
    end
    
  end

  def destroy
    params[:id]
    @post= Post.find_by(id: params[:id])
    @post.destroy
    redirect_to :root
    flash.now[:alert] = "Post Removed"
  end

  def edit
    id = params[:id]
    @post = Post.find_by(id: id)
  end

  def update
    id = params[:id].to_i
    @post = Post.find_by(id: id)
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Unable to update post. Try again."
    end
  end

  private
  def post_params
    p params.inspect
    params.require(:post).permit(:title, :text, :image)
  end
end
