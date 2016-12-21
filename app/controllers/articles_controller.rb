class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
   def new
       @article = Article.new
   end
   
   def edit
       @article = Article.find(params[:id])
   end
   
   def create
      @article = Article.new(article_params)
      
        if @article.save
            flash[:notice] = "Article was successfully created!"
            redirect_to article_path(@article) #redirects the newly created article to the show action
        else
            render :new
        end
   end
   
   def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
          flash[:notice] = "Article was successfully updated!"
          redirect_to article_path(@article)
      else
          render :edit
      end
   end
   
   def show
      @article = Article.find(params[:id])
   end
   
   private
   def article_params
      params.require(:article).permit(:title, :description) #takes as parameters the fields in article that are in the .permit
   end
    
end