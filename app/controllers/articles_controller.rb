include MatchHelper
class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index

    if params[:query].present? && params[:query].length > 2
      @articles = Article.search_by_title_and_content(params[:query])
      create_search(params[:query], current_user.id)
    else
      @articles = Article.all
    end
    @articles = @articles.paginate(per_page: 5, page: params[:page])
  end

  private

  def create_search(query, user_id)
    return unless query.present? && query.length > 2

    first_search = Search.where(user_id: user_id, confirmed: false).last
    first_search.update(confirmed: true) if first_search.present?

    if first_search && similar_chars?(first_search.query, query)
      first_search.update(query: query)
    else
      Search.create(query: query, user_id: user_id)
    end
  end
end
