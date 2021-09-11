Rails.application.routes.draw do
  # Create route to GET /articles which is mapped to the `index` action of `ArticlesController`
  get "/articles", to: "articles#index"
end
