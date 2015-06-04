Rails.application.routes.draw do
  mount Optimadmin::Engine => "/admin"
end

Optimadmin::Engine.routes.draw do
  resources :static_pages
  resources :external_links, only: [:create]
end
