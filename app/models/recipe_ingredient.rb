class RecipeIngredient < ApplicationRecord 
    belongs_to :recipe
    belongs_to :ingredient 

def ingredient_attributes=(ingredient_attributes)
       ingredient_attributes.values.each do |ia|
       ingredient = Ingredient.find_or_create_by(ingredient_attribute)
        self.ingredient = ingredient 
        end
end

end 