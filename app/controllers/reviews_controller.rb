class ReviewsController < ApplicationController


def index
end 
    
def new
@review = Review.new
end 
        
def create
@review = Review.new(review_params)
@review.save
redirect_to recipe_path(@recipe)
end 
    
def edit
@review = Review.find(params[:id])
end 
        
def update
@review = Review.find(params[:id])
@review.update(review_params)
redirect_to user_path(current_user)
end 
    
def destroy 
@review = Review.find(params[:id])
@review.destroy
redirect_to user_path(current_user)
end 
    
    
        
        
private
def review_params
params.require(:review).permit(:text, :user_id, :recipe_id)
end
      

end 