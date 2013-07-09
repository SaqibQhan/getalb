Getalb::Application.routes.draw do
  resource :home do
  end
  devise_for :users
  devise_scope :user do
    match 'auth/:provider/callback', to: 'users/sessions#create'
    match 'auth/failure', to: redirect('/')
    match 'signout', to: 'devise/sessions#destroy', as: 'signout'
  end

  resources :albumes do
    collection do
      get :rendering_template
      post :create_album
      post :update_album
    end
  end
  match "/index", to: 'home#index'
  root :to => 'albumes#new'

end
