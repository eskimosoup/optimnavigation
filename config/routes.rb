Rails.application.routes.draw do
  resources :menu_items, except: :show
  root to: "application#index"
end
