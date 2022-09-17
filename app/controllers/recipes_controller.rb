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
@recipe = current_user.recipes.build(recipe_params)
if @recipe.save 
redirect_to recipe_path(@recipe)
else 
render :new
end 

def edit 
@recipe = Recipe.find(params[:id])
10.times { @recipe.recipe_ingredients.build.build_ingredient}
end 

def update 
@recipe = Recipe.find(params[:id])
if @recipe.update(recipe_params)
redirect_to recipe_path(@recipe)
else 
render :edit 
end 

def destroy 
@recipe = Recipe.find(params[:id])
@recipe.destroy
redirect_to recipes_path
end 


private 
def recipe_params
params.require(:recipe).permit(:name, :description, :image_url, :user_id, recipe_ingredients_attributes: 
[:quantity, :id, ingredient_attributes: [:name]])
end 



end 