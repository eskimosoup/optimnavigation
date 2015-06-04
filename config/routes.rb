Rails.application.routes.draw do
  resources :menu_items, except: :show
  root to: "application#index"
  mount Optimadmin::Engine => "/admin"
end
Optimadmin::Engine.routes.draw do
  resources :static_pages
  resources :external_links, only: [:create]
end
