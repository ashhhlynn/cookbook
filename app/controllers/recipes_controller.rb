class RecipesController < ApplicationController

def index 
@recipes = Recipe.all
end 

def show
@recipe = Recipe.find(params[:id])
end 

def new 
@recipe = Recipe.new
10.times { @recipe.recipe_ingredients.build.build_ingredient } 
end 

def create
@recipe = @user.recipes.build(recipe_params)
@recipe.save
redirect_to recipe_path(@recipe)
end 

def edit 
@recipe = Recipe.find(params[:id])
end 

def update 
@recipe = Recipe.find(params[:id])
@recipe.update(recipe_params)
redirect_to recipe_path(@recipe)
end 

def destroy 
@recipe = Recipe.find(params[:id])
@recipe.destroy
redirect_to recipes_path
end 



private 
def recipe_params
params.require(:recipe).permit(:name, :description, :image_url, :user_id, recipe_ingredients_attributes: 
[:quantity, ingredient_attributes: [:name]])
end 



end 