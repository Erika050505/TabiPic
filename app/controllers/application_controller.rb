class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name, :phone_number ])
  end
  
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