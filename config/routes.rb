Rails.application.routes.draw do


  get 'lessons/create'
  get 'lesson_words/index'
  get 'lessons/index'
  get 'lesson/index'
  get 'categories/index'
  get 'word_answers/new'
  get 'word_answers/new'
  get 'word_answer/new'
  get 'words/new'
  get 'categories/new'
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

  namespace :admin do
    resources :categories do
      resources :words do
        resources :word_answers
      end
    end
  end

  resources :lessons do
    resources :lesson_words do
      resources :word_answers
    end
  end

  

  

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
