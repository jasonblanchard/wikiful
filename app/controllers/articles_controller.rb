class ArticlesController < ApplicationController
  def index
    @articles = Article.recent.limit(25)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
  end
end
