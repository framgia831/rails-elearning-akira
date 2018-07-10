Rails.application.routes.draw do


  get 'session/new'
  get 	'/users/index'
  get 	'/signup', to: 'users#new'

  get 		'/login', to: 'session#new'
  post 		'/login', to: 'session#create'
  delete	'/logout', to: 'session#destroy'
  
  root  'static_pages#home'
  get   '/about', to: 'static_pages#about'

  resources :users, except: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
