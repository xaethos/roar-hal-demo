class ArticlesController < ApplicationController
  include Roar::Rails::ControllerAdditions
  respond_to :json

  rescue_from Exception do |ex|
    render status: 500, json: {
      error: ex.class.name,
      message: ex.message,
      backtrace: ex.backtrace.select { |st| st.starts_with? Rails.root.to_s }
    }
  end

  def index
    respond_with Article.scoped
  end

  def search
    respond_with Article.where("title ILIKE ?", "%#{params[:title]}%")
  end

  def show
    respond_with Article.find(params[:id])
  end

  def create
    @article = consume! Article.new

    if @article.save
      respond_with @article, status: :created, location: @article
    else
      respond_with @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = consume! Article.find(params[:id])

    if @article.save
      head :no_content
    else
      respond_with @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    head :no_content
  end

end
