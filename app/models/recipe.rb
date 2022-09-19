class Recipe < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true 
    validates(:name, { :length => { :maximum => 100 } })
    validates :description, presence: true 
    validates :recipe_ingredients, presence: true
    validates :image_url, presence: true
    validates :image_url, format: {with: /\.(png|jpg)\Z/i}

    accepts_nested_attributes_for :recipe_ingredients, :reject_if => proc { |attrs| attrs[:quantity].blank? || attrs[:ingredient_attributes][:name].blank?} 

end 