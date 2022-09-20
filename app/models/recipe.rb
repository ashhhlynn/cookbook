class Recipe < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    validates :name, length: { maximum: 50 }
    validates :name, presence: true 
    validates :description, presence: true 
    validates :description, length: { maximum: 500 }
    validates :recipe_ingredients, presence: true
    validates :image_url, presence: true
    validates :image_url, format: {with: /\.(png|jpg)\Z/i}

    accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true, :reject_if => proc { |attrs| attrs[:quantity].blank? || attrs[:ingredient_attributes][:name].blank?} 
    default_scope { order('recipes.name ASC') } 

    def self.by_user(user_id)
    where(user: user_id)
    end 

    def self.most_recent
    @recipes = Recipe.reorder("created_at DESC")
    end 
  
    def self.reviews_count
    @recipes = Recipe.joins(:reviews).group('recipes.id').reorder("COUNT(reviews.id) DESC")
    end 
  
    def self.ingredients_count
    @recipes = Recipe.joins(:recipe_ingredients).group('recipes.id').reorder("COUNT(recipe_ingredients.id)")
    end 

end 