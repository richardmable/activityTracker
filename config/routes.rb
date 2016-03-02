Rails.application.routes.draw do

  # so that devise_token_auth can connect to the routes of ng-token-auth
  mount DeviseTokenAuth::Engine => "/auth"
  # serve the angular app as the root
  root 'application#angular'
  # devise_token_auth paths, overriding omni_auth callbacks to grab access-token
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  omniauth_callbacks: 'registrations'}
  # for displaying the auto-generated profile from Strava, and to update
  get 'profiles' => 'profiles#index', as: :profiles
  # to grab activities from strava
  get 'activities' => 'activities#update', as: :activity_update
  get 'fatigues' => 'fatigues#update', as: :fatigue_update


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
