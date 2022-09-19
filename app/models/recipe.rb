class Recipe < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    validates :name, length: { maximum: 50 }
    validates :name, presence: true 
    validates :description, presence: true 
    validates :recipe_ingredients, presence: true
    validates :image_url, presence: true
    validates :image_url, format: {with: /\.(png|jpg)\Z/i}

    accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true, :reject_if => proc { |attrs| attrs[:quantity].blank? || attrs[:ingredient_attributes][:name].blank?} 
    default_scope { order('recipes.name ASC') } 
end 