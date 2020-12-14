Rails.application.routes.draw do
  devise_for :customers
  root :to => 'posts#index'
  get "/about" => "homes#about"
  
  resources :posts do
    resource :comments, only: [:create, :destroy]
  end
  resources :customers, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  get '/search' => 'search#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end