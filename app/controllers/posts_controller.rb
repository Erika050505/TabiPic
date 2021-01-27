class PostsController < ApplicationController
before_action :authenticate_customer!, only: [:edit, :update, :destroy]
before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
    @areas = Area.all
  end

  def index
    @posts = Post.all
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}")
    elsif params[:area_id]
      @area = Area.find(params[:area_id])
      @posts = Post.where(area_id: params[:area_id])
    elsif params[:q]
      @word = params["q"]["sentence_cont"]
      @posts = @search.result
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @customer = Customer.find(@post.customer_id)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      tags = Vision.get_image_data(@post.image)    
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
      redirect_to root_path
    else
      @areas = Area.all
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @areas = Area.all
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
    params.require(:post).permit(:image, :sentence, :area_id, :tag_list)
  end
  
  def ensure_correct_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
    redirect_to root_path
    end
  end
end