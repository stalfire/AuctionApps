Rails.application.routes.draw do
	resources :users
	resources :auctions

	get    '/login' => 'sessions#new'
  	post   '/login' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'

	get "/sign_up" => "users#new", as: "sign_up"

	get "/auth/:provider/callback" => "sessions#create_from_omniauth"

	get 'braintree/new'
	post 'braintree/checkout'

	post "/bid" => "auctions#bid"
	
	get "/test" => "home#test"

  	root 'home#index'
end
