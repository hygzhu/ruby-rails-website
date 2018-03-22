class ArticlesController < ApplicationController
    
    #Listing all articles
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id]) #finds the article of interest with id
    end

    #defined an action
    def new
    end

    #When the form is submitted
    def create
        #saves the model to the database
        @article = Article.new(article_params)
 
        @article.save #returns a bool
        redirect_to @article
    end


    private
        def article_params 
            params.require(:article).permit(:title, :text) #with strong params to prevent malicious requests
        end

end
