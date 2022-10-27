class RecipesController < ApplicationController

before_action :require_login
skip_before_action :require_login, only: [:index, :show]
before_action :user_ownership, only: [:edit, :destroy]
before_action :recipe_exists, only: [:show]

def index 
    @users = User.all
    @ingredients = Ingredient.all 
    if !params[:user].blank?
        @recipes = Recipe.by_user(params[:user])
    elsif !params[:ingredient].blank?
        @recipes = Recipe.by_ingredient(params[:ingredient])
    elsif !params[:recency].blank?
        @recipes = Recipe.most_recent
    elsif !params[:reviews_count].blank?
        @recipes = Recipe.reviews_count
    elsif !params[:ingredients_count].blank?
        @recipes = Recipe.ingredients_count
    else
        @recipes = Recipe.all
    end 
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
        10.times { @recipe.recipe_ingredients.build.build_ingredient}
        render :new
    end 
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
        10.times { @recipe.recipe_ingredients.build.build_ingredient}
        render :edit 
    end 
end 

def destroy 
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
end 

private 

def recipe_params
    params.require(:recipe).permit(:name, :description, :image_url, :user_id, recipe_ingredients_attributes: [:quantity, :id, :_destroy, ingredient_attributes:[:name]])
end 

end 