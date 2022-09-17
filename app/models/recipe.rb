class Recipe < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients

    accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |attrs| attrs[:quantity].blank? || attrs[:ingredient_attributes][:name].blank?} 

end 