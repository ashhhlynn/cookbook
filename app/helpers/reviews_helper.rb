module ReviewsHelper

def r 
    Recipe.find(params[:recipe_id])
end 

end
