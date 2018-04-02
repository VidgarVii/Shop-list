Rails.application.routes.draw do
  
  root 'hello#index'
    
  devise_for :users
   

  resources :carts do 
      resources :items
    end
  
 
 # get 'users/profile', as: 'user_root'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
