Rails.application.routes.draw do
  root to: 'questions#index'

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
end
