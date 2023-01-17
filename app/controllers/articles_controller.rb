class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.search_by_title_and_content(params[:query])
    else
      @articles = Article.all
    end
  end
end
