Rails.application.routes.draw do
  resources :follows
  root to: "posts#index"
  devise_for :users
    post '/users/:id/follow.html.erb', to: "users#follow.html.erb", as: "follow_user"
    post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :posts do
    resources :comments
    resources :likes

  end

end
