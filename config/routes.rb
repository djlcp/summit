Rails.application.routes.draw do

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
		resources :sections do
			resources :tasks do
				resources :steps 
			end
		end
	end

  resources :sessions

end
