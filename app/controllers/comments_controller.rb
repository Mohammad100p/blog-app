class CommentsController < ApplicationController


  http_basic_authenticate_with name: 'ammar', password: 'khan', only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comments = @article.comments.create(comments_params)
    respond_to do |format|
      if @comments.save
        redirect_to article_path(@article)

        format.js
      end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:article_comment_id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end


  private

  def comments_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
