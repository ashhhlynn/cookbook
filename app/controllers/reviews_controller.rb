class ReviewsController < ApplicationController

before_action :require_login
skip_before_action :require_login, only: [:index, :show]
before_action :recipe_exists_review, only: [:new, :index, :edit]
before_action :user_ownership_review, only: [:show, :edit]

def index
    @reviews = Recipe.find(params[:recipe_id]).reviews
end 

def show 
    @review = Review.find(params[:id])
end 

def new
    @review = Review.new(recipe_id: params[:recipe_id])
end 

def create
    @review = Review.new(review_params)
    @review.user = current_user 
    if @review.save
        redirect_to review_path(@review)
    else 
        render :new
    end 
end 
    
def edit
    #' recipe = Recipe.find(params[:recipe_id]) '
    #' recipe = Recipe.find_by(id: params[:recipe_id]) '
   #' @review = recipe.reviews.find_by(id: params[:id]) ' #'?'
    @review = Review.find(params[:id])
end 

def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
        redirect_to review_path(@review)
    else
        render :edit 
    end 
end 
    
def destroy 
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to recipes_path
end 
           
private

def review_params
    params.require(:review).permit(:text, :user_id, :recipe_id)
end

end