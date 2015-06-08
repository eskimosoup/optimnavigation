Rails.application.routes.draw do
  resources :pages
  root to: "application#index"
  mount Optimadmin::Engine => "/admin"
end
Optimadmin::Engine.routes.draw do
  resources :menu_items, except: :show do
    collection do
      #get 'update_leaf_form'
      #get 'update_tag_select'
      get 'update-link-resources'
      get 'reorder'
      post 'order'
    end
  end

  resources :static_pages
  resources :external_links, only: [:create]
end
