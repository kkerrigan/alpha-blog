class CategoriesController < ApplicationController
   
   def index
      @categories = Category.all 
   end
   
   def new
      @category = Category.new 
   end
   
   def create
      @category = Category.new(cat_params)
      if @category.save
         flash[:success] = "Category was created successfully"
         redirect_to categories_path
      else
         render :new
      end
   end
   
   def show
       
   end
    
    private
    def cat_params
       params.require(:category).permit(:name)
    end
end