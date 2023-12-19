Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :update_posts, only: %i[index new create] do
    resources :tag_update_posts, only: :new
  end
  resources :tags, only: :index
  resources :users, only: :index

  post 'update_posts/:id/tag' => 'tag_update_posts#add_tags', as: :tag_update_post

  root 'update_posts#index'
end
