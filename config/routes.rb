WildCider::Application.routes.draw do
	resources :updates
	resources :advertisements
	resources :people
	resources :users
	resources :ciders
	resources :sessions, only: [:new, :create, :destroy]
	
	root 	'home_pages#index'
	match '/the_cider', 			to: 'home_pages#cider',						via: 'get'
	match '/about_us', 				to: 'home_pages#about_us',				via: 'get'
 	match '/contact_us', 			to: 'home_pages#contact_us',			via: 'get'
	match '/resources',				to: 'home_pages#resources',				via: 'get'
	match '/signin', 					to: 'sessions#new',								via: 'get'
	match '/signout',					to: 'sessions#destroy',						via: 'delete'
	match '/admin', 					to: 'home_pages#admin',						via: 'get'

	# The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
