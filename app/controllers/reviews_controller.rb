class ReviewsController < ApplicationController

before_action :require_login
skip_before_action :require_login, only: [:index]
before_action :recipe_exists_review, only: [:new, :index, :edit]

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
    recipe = Recipe.find_by(id: params[:recipe_id])
    @review = recipe.reviews.find_by(id: params[:id])
    if @review == nil || @review.user != current_user 
        flash[:alert] = "You aren't the owner of this review!"
        redirect_to root_path
    end 
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
    params.require(:review).permit(:text, :user_id, :recipe_id, recipe_attributes: [:id])
end

end