class ApplicationController < ActionController::Base

helper_method :current_user 

def index 
end 

def current_user
@user = User.find_by(id: session[:user_id])
end

end
