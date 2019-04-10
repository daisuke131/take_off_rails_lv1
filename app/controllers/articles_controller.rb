class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :current_user, only: [:create, :update, :destroy]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
  end

  def create
    Article.create!(article_params)
  end

  def update
    @article.update!(article_params)
  end

  def destroy
    @article.destroy!
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def current_user
      User.first
    end

    def article_params
      params.require(:article).permit(:title, :body).merge(user_id: current_user.id)
    end
end
