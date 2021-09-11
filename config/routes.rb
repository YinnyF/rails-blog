Rails.application.routes.draw do
  # Set the app homepage to /articles
  root "articles#index"
  
  # resources maps all of the conventional routes for a collection of resources
  resources :articles do
    # This creates comments as a nested resource within articles. This is another part of capturing the hierarchical relationship that exists between articles and comments.
    resources :comments
  end
end
