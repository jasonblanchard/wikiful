class WelcomeController < ApplicationController
  def index
    @articles = Article.recent.limit(5)
  end
end
