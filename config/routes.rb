Rails.application.routes.draw do

  resources :meetings do
    resources :students
  end

  root 'meetings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
