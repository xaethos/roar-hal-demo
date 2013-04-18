class ArticlesController < ApplicationController
  include Roar::Rails::ControllerAdditions
  respond_to :json

  def index
    @articles = Article.all

    respond_with @articles
  end

  def search
    @articles = Article.where("title ILIKE ?", "%#{params[:title]}%").all
    respond_with @articles
  end

  def show
    @article = Article.find(params[:id])

    respond_with @article
  end

  def create
    @article = Article.new(params[:article])

    if @article.save
      respond_with @article, status: :created, location: @article
    else
      respond_with @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      head :no_content
    else
      respond_with @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    head :no_content
  end
end
