class SessionsController < ApplicationController 

def new 
end 

def create 
  if auth
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['username']
      u.password = SecureRandom.hex
    end
    session[:user_id] = user.id
    redirect_to recipes_path
  else      
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) 
      session[:user_id] = user.id 
      redirect_to recipes_path
    else
      flash[:alert] = "Your Email or Password is Invalid! Try again."
      render :new
    end 
  end 
end 

def destroy
  session.delete :user_id
  redirect_to root_path
end

private 

def auth
  request.env['omniauth.auth']
end

end 
