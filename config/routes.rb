Rails.application.routes.draw do


	devise_for :users , controllers: {
		registrations: 'users/registrations'
	}

	resources :users do
		resources :campaigns
	end

	resources :campaigns do
		collection do
			get 'medical'
			get 'education'
			get 'charity'
			get 'community'
			get 'events'
			get 'dashboard'
		end
	end

	resources :campaigns do
		resources :comments
		resources :donations
	end

	match '/contacts',     to: 'contacts#new',             via: 'get'
	resources "contacts", only: [:new, :create]

	root 'static_pages#home'

    get 'users/show'
	get 'plus_like' => 'campaigns#plus_like', as: :plus_like

end
