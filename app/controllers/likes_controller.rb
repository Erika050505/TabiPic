class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = current_customer.likes.new(post_id: post.id)
    like.save
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_customer.likes.find_by(post_id: post.id)
    like.destroy
    redirect_to root_path
  end
end
