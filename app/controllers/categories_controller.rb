class CategoriesController < ApplicationController
  def index
    @categories = Category.alphabetized
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.recent
  end
end
