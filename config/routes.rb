Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users , only: [:new, :create]
  resources :restaurants
  resources :comments, except: [:new, :edit, :update]
  resources :posts

  get '/comments/new/:id', to: 'comments#new', as:'new_comment'
  post '/comments/:id', to: 'comments#create'

  get '/comments/edit/:id', to: 'comments#edit', as:'edit_comment'
  patch '/comments/:id', to: 'comments#update'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'welcome#home'


end
