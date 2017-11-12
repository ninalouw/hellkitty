Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'announcements#index'
  # announcements
  get "/announcements/new" => "announcements#new", as: :new_announcement
  post "/announcements" => "announcements#create", as: :announcements
  get "/announcements/:id" => "announcements#show", as: :announcement
  get "/announcements" => "announcements#index"
  get "/announcements/:id/edit" => "announcements#edit", as: :edit_announcement
  patch "/announcements/:id" => "announcements#update"
  delete "/announcements/:id" => "announcements#destroy"
  #galleries
  get "/galleries/new" => "galleries#new", as: :new_gallery
  post "/galleries" => "galleries#create", as: :galleries
  get "/galleries/:id" => "galleries#show", as: :gallery
  get "/galleries" => "galleries#index"
  get "/galleries/:id/edit" => "galleries#edit", as: :edit_gallery
  patch "/galleries/:id" => "galleries#update"
  delete "/galleries/:id" => "galleries#destroy"

  # static pages
  get '/about-ian' => 'home#about_ian'
  get '/about-pia' => 'home#about_pia'
  get '/store' => 'home#store'
  get '/contact' => 'home#contact'
  # users
  resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
  end
end
