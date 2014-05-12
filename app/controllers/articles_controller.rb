class ArticlesController < ApplicationController
  def index
    @articles = Article.recent.limit(25)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = User.articles.create(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_ids => [])
  end
end
