class RecipeIngredient < ApplicationRecord 
    belongs_to :recipe
    belongs_to :ingredient 

    validates :quantity, presence: true
    validates(:quantity, { :length => { :maximum => 40 } })
    validates :recipe, presence: true 
    validates :ingredient, presence: true 

def ingredient_attributes=(ingredient_attributes)
       ingredient_attributes.values.each do |ia|
       ingredient = Ingredient.find_or_create_by(name: ia.downcase)
       self.ingredient = ingredient 
       end
end

end 