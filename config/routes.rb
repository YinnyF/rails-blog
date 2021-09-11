Rails.application.routes.draw do
  # Set the app homepage to /articles
  root "articles#index"
  
  # resources maps all of the conventional routes for a collection of resources
  resources :articles
end
