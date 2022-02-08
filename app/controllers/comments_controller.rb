class CommentsController < ApplicationController


  http_basic_authenticate_with name: 'ammar', password: 'khan', only: :destroy

  def create
    @article = Article.find(params[:id])
    @comments = @articl.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end


  private

  def comments_params
    params.require(:comment).permits(:commenter, :body, :status)
  end
end
