class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.published.all
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    case @article.status
    when "draft"
      @article = current_user.articles.find(params[:id])
    when "published"
      @article = Article.published.find(params[:id])
    end
    render json: @article
  end

  def create
    @article = current_user.articles.create!(article_params)
    render json: @article
  end

  def update
    @article.update!(article_params)
    render json: @article
  end

  def destroy
    @article.destroy!
    render json: @article
  end

  private
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
