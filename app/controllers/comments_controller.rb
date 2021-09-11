class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    # the complexity is a side-effect of the nesting that you've set up
    # Each request for a comment has to keep track of the article to which the comment is attached
    @article = Article.find(params[:article_id])
    # .create: This will automatically link the comment so that it belongs to that particular article.
    @comment = @article.comments.create(comment_params)
    # essentially refreshes the page
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
