class ArticlesController < ApplicationController
    
    #Must authenticate unless viewing index or show
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    #Listing all articles
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id]) #finds the article of interest with id
    end

    #defined an action
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    #When the form is submitted
    def create
        #saves the model to the database
        @article = Article.new(article_params)
 
        if @article.save
            #A valid article was given
            redirect_to @article
          else
            #Re-render current page
            render 'new'
          end
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    private
        def article_params 
            params.require(:article).permit(:title, :text) #with strong params to prevent malicious requests
        end

end
