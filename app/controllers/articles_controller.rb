class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    # using instance variable to store the article found by id.
    # Rails passes all instance variables to the view
    @article = Article.find(params[:id])
  end

  def new

  end

  def create
    # initializing Rails model with its respective attributes, which is automatically mapped to the
    # respective database columns
    @article = Article.new(article_params)

    # the below is responsible for saving the model in the database
    @article.save

    # redirect the user to the show action
    redirect_to @article
  end

  # Whitelisting controller parameters to prevent wrong mass assignment
  # Allowing and requiring the title and text parameters
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
