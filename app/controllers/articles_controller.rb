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
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # initializing Rails model with its respective attributes, which is automatically mapped to the
    # respective database columns
    @article = Article.new(article_params)

    # the below is responsible for saving the model in the database
    if @article.save
      # redirect the user to the show action
      redirect_to @article
    else
      # we use render and not redirect so that the @article object is passed back to the new template
      #  when it's rendered, whereas 'redirect' tells the browser to issue another request
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    # the method update is used to update a record that already exists
    # it accepts a hash containing the attributes that need updating
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # Whitelisting controller parameters to prevent wrong mass assignment
  # Allowing and requiring the title and text parameters
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
