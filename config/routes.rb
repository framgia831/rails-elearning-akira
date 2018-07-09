Rails.application.routes.draw do


  get 	'/users/index'
  get 	'/signup', to: 'users#new'
  

  root  'static_pages#home'
  get   '/about', to: 'static_pages#about'

  resources :users, except: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
