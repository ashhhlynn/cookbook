class ApplicationController < ActionController::Base

helper_method :current_user 
helper_method :require_login
helper_method :user_ownership
helper_method :user_review_ownership

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
    if @recipe.user != current_user
    redirect_to user_path(current_user)
    end 
end 

def user_review_ownership
@review = Review.find_by(id: params[:id])
    if @review.user != current_user
    redirect_to user_path(current_user)
    end 
end 

end
