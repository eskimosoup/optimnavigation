Rails.application.routes.draw do
  resources :example_modules
  root to: 'example_modules#index' 
  mount Optimadmin::Engine => "/admin"
end

Optimadmin::Engine.routes.draw do
  resources :static_pages
  resources :external_links, only: [:create]
end
