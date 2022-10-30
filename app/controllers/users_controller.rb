class UsersController < ApplicationController

def index 
    @users = User.all 
end 

def show 
    @user = User.find_by(id: params[:id])
    if @user == nil 
        flash[:alert] = "This user doesn't exist!"
        redirect_to users_path
    end
end 

def new 
    @user = User.new 
end 

def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else 
        render :new
    end 
end 

private 

def user_params 
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
end 

end 