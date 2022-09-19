class User < ApplicationRecord 
    has_many :recipes
    has_many :reviews

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true 
    validates :email, uniqueness: true 
    validates :password, presence: true 


end 