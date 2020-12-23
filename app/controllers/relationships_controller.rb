class RelationshipsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def create
    following = current_customer.follow(@customer)
    if following
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to @customer
    end
  end

  def destroy
    following = current_customer.unfollow(@customer)
    if following
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to @customer
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to @customer
    end
  end

  private
  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end