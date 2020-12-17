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
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :user_name, :profile_image, :introduction)
  end
end
