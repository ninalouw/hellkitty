Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'announcements#index'
  get "/announcements/new" => "announcements#new", as: :new_announcement
  post "/announcements" => "announcements#create", as: :announcements
  get "/announcements/:id" => "announcements#show", as: :announcement
  get "/announcements" => "announcements#index"
  get "/announcements/:id/edit" => "announcements#edit"
  patch "/announcements/:id" => "announcements#update"
  delete "/announcements/:id" => "announcements#destroy"
end
