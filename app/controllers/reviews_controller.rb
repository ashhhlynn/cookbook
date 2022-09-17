class ReviewsController < ApplicationController


def index
@recipe = Recipe.find(params[:recipe_id])
@reviews = @recipe.reviews 
end 
    
def new
@recipe = Recipe.find(params[:recipe_id])
@review = Review.new
end 
     
def create
@recipe = Recipe.find(params[:recipe_id])
@review = @recipe.reviews.build(review_params)
@review.user = current_user 
# ' do i need '
@review.save
redirect_to root_path
end 
    
def edit
@review = Review.find(params[:id])
end 
        
def update
@review = Review.find(params[:id])
if @review.update(review_params)
redirect_to recipes_path
else
render :edit 
end 
end 
    
def destroy 
@review = Review.find(params[:id])
@review.destroy
redirect_to recipe_path(@recipe)
end 
    
    
        
        
private
def review_params
params.require(:review).permit(:text, :user_id, :recipe_id)
end
      

end 