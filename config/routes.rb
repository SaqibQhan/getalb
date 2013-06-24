Getalb::Application.routes.draw do
  resource :home
  devise_for :users
  devise_scope :user do
    match 'auth/:provider/callback', to: 'users/sessions#create'
    match 'auth/failure', to: redirect('/')
    match 'signout', to: 'users/sessions#destroy', as: 'signout'
  end
  root :to => 'home#index'

end
