class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      @articles = Article.search_by_title_and_content(params[:query])
    else
      @articles = Article.all
    end
    @articles = @articles.paginate(per_page: 5, page: params[:page])
  end
end
