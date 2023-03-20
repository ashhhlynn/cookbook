class ApplicationController < ActionController::Base

helper_method :current_user

def index 
end 

def current_user
    @user = User.find_by(id: session[:user_id])
end
    
def require_login
    if !current_user 
        flash[:alert] = "You must be logged in to view this page!"
        redirect_to root_path
    end
end

def user_ownership
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe == nil || @recipe.user != current_user
        flash[:alert] = "This recipe doesn't belong to you!"
        redirect_to recipes_path
    end 
end 

def recipe_exists
    if Recipe.find_by(id: params[:id]) == nil 
        flash[:alert] = "This recipe doesn't exist!"
        redirect_to recipes_path
    end 
end 

def recipe_exists_review
    if Recipe.find_by(id: params[:recipe_id]) == nil 
        flash[:alert] = "This recipe doesn't exist!"
        redirect_to recipes_path
    end 
end 

def user_ownership_review
    @review = Review.find_by(id: params[:id])
    if @review == nil || @review.user != current_user 
        flash[:alert] = "This review doesn't exist or it doesn't belong to you!"
        redirect_to recipes_path
    end 
end 

end