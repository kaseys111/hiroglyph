Rails.application.routes.draw do

  root "statuses#index"
  
  # Routes for the Reaction resource:
  # CREATE
  get "/reactions/new", :controller => "reactions", :action => "new"
  post "/create_reaction", :controller => "reactions", :action => "create"

  # READ
  get "/reactions", :controller => "reactions", :action => "index"
  get "/reactions/:id", :controller => "reactions", :action => "show"

  # UPDATE
  get "/reactions/:id/edit", :controller => "reactions", :action => "edit"
  post "/update_reaction/:id", :controller => "reactions", :action => "update"

  # DELETE
  get "/delete_reaction/:id", :controller => "reactions", :action => "destroy"
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Status resource:
  # CREATE
  get "/statuses/new", :controller => "statuses", :action => "new"
  post "/create_status", :controller => "statuses", :action => "create"

  # READ
  get "/statuses", :controller => "statuses", :action => "index"
  get "/statuses/:id", :controller => "statuses", :action => "show"

  # UPDATE
  get "/statuses/:id/edit", :controller => "statuses", :action => "edit"
  post "/update_status/:id", :controller => "statuses", :action => "update"

  # DELETE
  get "/delete_status/:id", :controller => "statuses", :action => "destroy"
  #------------------------------

  devise_for :users
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
