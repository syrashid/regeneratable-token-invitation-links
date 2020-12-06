Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?

  root 'groups#index'

  resources :groups, param: :invite_token, only: :show do
    resources :memberships, only: [ :new, :create ]
    resource :invite_link, only: :show
  end

end
