Rails.application.routes.draw do


  get 'relationships/create'
  get 'session/new'
  
  get 	'/signup', to: 'users#new'

  get 		'/login', to: 'session#new'
  post 		'/login', to: 'session#create'
  delete	'/logout', to: 'session#destroy'
  
  root  'static_pages#home'
  get   '/about', to: 'static_pages#about'

  resources :users, except: :new do
      member do
        get 'following', 'followers'
      end
  end

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
