class ArticlesController < ApplicationController

  # we want the user to be authenticated on every action except index and show
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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

  # fetches the article from the db and stores it in @article so it can be used.
  # it renders edit.html.erb
  def edit
    @article = Article.find(params[:id])
  end

  # It re-fetches the aarticle from the db and attempts to update it with the submitted
  # form data filtered by article_params.
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    # can also redirect to articles_path in other circumstances
    redirect_to root_path
  end

  private
    # strong params for security
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

end
