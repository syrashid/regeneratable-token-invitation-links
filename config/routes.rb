Rails.application.routes.draw do
  devise_for :users
  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?

  root to: 'groups#index'

  resources :groups, only: [] do
    resources :memberships, only: [ :new, :create ]
  end
end
