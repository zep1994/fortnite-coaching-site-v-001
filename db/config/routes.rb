Rails.application.routes.draw do

  get '/login' => "sessions#new"
  post 'sessions' => "sessions#create"

  resources :meetings do
    resources :students
  end

  root 'meetings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
