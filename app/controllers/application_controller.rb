class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def search
    # @search = Post.ransack(params[:q])
    # @search_posts = @search.result.page(params[:page])
    # @content = params[:content]
  end

end