Rails.application.routes.draw do
  #get 'edit_user/:id', to: 'users#edit', as: "edit_user"
  resources :businesses do 
    resources :reviews 
    resources :photos do
      match '/remove', to: 'businesses#remove', via: 'delete'
    end 
  end
  devise_for :users, controllers: {registrations: 'user/registrations'}
  resources :users
  get '/business_profile/:id', to: 'users#business_profile', as: "business_profile"
  root to: 'businesses#index'
  resources :after_signup ,only: [:show, :update]

end
