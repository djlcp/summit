Rails.application.routes.draw do

  resources :profiles
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  root to: 'pages#home'
  devise_for :users, path: 'users' , controllers: { sessions: "users/sessions" }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


