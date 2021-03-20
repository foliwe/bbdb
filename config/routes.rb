Rails.application.routes.draw do
  resources :users ,only: [:show]
  resources :businesses do 
    resources :photos do
      match '/remove', to: 'businesses#remove', via: 'delete'
     end 
  end
  devise_for :users, controllers: {registrations: 'user/registrations'}
  root to: 'home#index'
  resources :after_signup ,only: [:show, :update]

end
