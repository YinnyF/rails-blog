Rails.application.routes.draw do
  # Set the app homepage to /articles
  root "articles#index"
  
  # Create route to GET /articles which is mapped to the `index` action of `ArticlesController`
  get "/articles", to: "articles#index"
end
