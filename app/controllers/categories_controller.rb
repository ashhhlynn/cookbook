class CategoriesController < ApplicationController

def new
@category = Category.new
end 

def create
@category = Category.create(category_params)
redirect_to root_path
end 



private 
def category_params
    params.require(:category).permit(:name)
    
end 


end 