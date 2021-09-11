class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # this instantiates a new article but does not save it.
  # will be used in the view when building the form
  def new
    @article = Article.new
  end

  # instantiates a new article with values and then attempts to save it.
  def create
    @article = Article.new(article_params)

    if @article.save
      # redirects the browser to the article's page at "http://localhost:3000/articles/#{@article.id}".
      redirect_to @article
    else
      # redirects to the form again
      render :new
    end
  end

  private
    # strong params for security
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
