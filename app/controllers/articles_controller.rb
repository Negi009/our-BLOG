class ArticlesController < ApplicationController

  before_action :article_find, only: [:show, :edit, :update, :destroy ]
  def index
    @articles = Article.all
  end 
  
  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def Edit

  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image)
  end

  def article_find
    @article = Article.find(params[:id])
  end

end
