Rails.application.routes.draw do
<<<<<<< HEAD
  resources :users ,only: [:show]
=======
  resources :users do 
    resources :profile ,only: [:index]
  end
  get 'users/show'
>>>>>>> userProfile
  resources :businesses do 
    resources :photos do
      match '/remove', to: 'businesses#remove', via: 'delete'
     end 
  end
  devise_for :users, controllers: {registrations: 'user/registrations'}
  root to: 'home#index'
  resources :after_signup ,only: [:show, :update]

end
