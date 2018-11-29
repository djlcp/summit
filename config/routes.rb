Rails.application.routes.draw do

  resources :profiles
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users' , controllers: { sessions: "users/sessions" }
  

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


	root to: 'projects#index'

  resources :questions do 
  	scope module: :questions do
  		resources :comments
  	end
  	resources :answers do
  		scope module: :answers do
  			resources :comments
  		end
  	end
  end

	resources :projects do
    resources :lessons, only: [:new, :create, :index]
    resources :users_projects
		resources :sections, only: [:new, :create]
	end

  resources :lessons, only: [:edit, :update, :destroy, :index, :show]

  resources :sections, only: [:edit, :update, :destroy, :show] do
      resources :tasks, only: [:new, :create] 
  end

  resources :tasks, only: [:edit, :update, :destroy, :show] do
    resources :steps, only: [:new, :create]
  end

  resources :steps, only: [:edit, :update, :destroy, :show] do
    resources :completes, only: [:new, :create, :edit, :update]
  end

  resources :completes, only: [:destroy]

end


