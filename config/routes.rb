Rails.application.routes.draw do

	root to: 'projects#index'

	resources :questions do 
		resources :answers
	end

	resources :projects do
		resources :sections do
			resources :tasks do
				resources :steps 
			end
		end
	end

end
