class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(params[:post_id])
    else
      render 'posts/show'
  end

  def destroy
    Comment.find_by(post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end