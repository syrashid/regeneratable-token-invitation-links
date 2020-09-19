Rails.application.routes.draw do
  get 'groups/index'
  devise_for :users
  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?
  root to: 'groups#index'

  resources :groups, only: :index

end
