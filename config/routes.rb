Rails.application.routes.draw do
	
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :messages, :items, :prices, :products

	resources :buildings do 
		resources :rooms
		resources :chatrooms
	end

	# resources :rooms do
	# 	resources :prices do
	# 		resources :purchases
	# 	end			
	# 	resources :purchases
	# 	resources :sales
	# 	resources :chatrooms
	# end

	# ajax action to add items to form
	post "items/:product_id", to: "items#new", as: "add_item"

	# landing page
	post "subscription", to: 'buildings#createSubscription'

	mount ActionCable.server => '/cable'

	root to: "buildings#welcome"
end