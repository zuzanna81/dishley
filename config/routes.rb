Rails.application.routes.draw do
  get 'restaurant/index'
  root controller: :restaurant, action: :index
end
