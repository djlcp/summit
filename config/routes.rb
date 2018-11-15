Rails.application.routes.draw do

  devise_for :installs
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
		resources :sections do
			resources :tasks do
				resources :steps 
			end
		end
	end

  resources :lessons, only: [:edit, :update, :destroy, :index, :show]


end
