class ApplicationController < ActionController::Base

helper_method :current_user 
helper_method :require_login
helper_method :user_ownership
helper_method :user_review_ownership
helper_method :recipe_owned
helper_method :recipe_exists 

def index 
end 

def current_user
@user = User.find_by(id: session[:user_id])
end

def require_login
return head(:forbidden) unless session.include? :user_id
end

def user_ownership
@recipe = Recipe.find_by(id: params[:id])
    if @recipe == nil || @recipe.user != current_user
    flash[:alert] = "You aren't the owner of this recipe!"
    redirect_to recipes_path
    end 
end 

def recipe_exists
    if Recipe.find_by(id: params[:id]) == nil
    flash[:alert] = "There isn't a recipe with this ID"
    redirect_to recipes_path 
    end 
end 

def recipe_owned 
@recipe = Recipe.find_by(id: params[:id])
@recipe.user == current_user 
end 


def user_review_ownership
@recipe = Recipe.find_by(id: params[:id])
@review = Review.find_by(id: params[:id])
    if @review == nil || @review.user != current_user
    flash[:alert] = "You aren't the owner of this review!"
    redirect_to root_path
    end 
end 

end
