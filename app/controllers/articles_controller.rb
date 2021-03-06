class ArticlesController < ApplicationController
  before_action :show_action, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: 'ammar', password: 'khan', except: [:index , :show]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def show_action
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
