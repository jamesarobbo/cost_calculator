Rails.application.routes.draw do

  resources :users do
    resources :activities do
      resources :items
    end  
  end  

  resource :session

  root "users#new"

end
