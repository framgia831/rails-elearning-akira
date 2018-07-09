Rails.application.routes.draw do


  get 	'/users/index'
  get 	'/signup', to: 'users#new'
  post 	'/users/create', to: 'users#create'
  get 	'/users/:id', to: 'users#show'

  root  'static_pages#home'
  get   '/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
