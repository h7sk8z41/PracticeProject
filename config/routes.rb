Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users
  resources :posts do
    resources :comments
    resources :likes
  end

end
