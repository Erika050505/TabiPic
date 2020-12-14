class CustomersController < ApplicationController
  def index
    @customer = current_customer
    @comment = Comment.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end
