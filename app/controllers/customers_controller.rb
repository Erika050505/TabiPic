class CustomersController < ApplicationController
# before_action :authenticate_customer!
# before_action :ensure_correct_customer, only: [:edit, :update, :destroy]
  def show
    @customer = current_customer
    #@customer = Customer.find(params[:id])
    @comment = Comment.new
    @post = Post.find_by(id:params[:id])
    @posts = current_customer.posts
  end

  def edit
  end

  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :user_name, :profile_image)
  end
end
