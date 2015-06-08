Rails.application.routes.draw do
  root to: "application#index"
  mount Optimadmin::Engine => "/admin"
end
Optimadmin::Engine.routes.draw do
  resources :menu_items, except: :show do
    collection do
      #get 'update_leaf_select'
      #get 'update_leaf_form'
      #get 'update_tag_select'
      get 'reorder'
      post 'order'
    end
  end

  resources :static_pages
  resources :external_links, only: [:create]
end
