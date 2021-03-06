Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  get '/logout'=> 'sessions#destroy'

  resources :users

  resources :meetings do
    resources :students
  end


  get '/auth/:provider/callback' => 'sessions#create'

  root 'welcome#hompage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
