class PostsController < ApplicationController
  #before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    end
  
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @customer = Customer.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:image, :sentence, :area, :tag)
  end
end