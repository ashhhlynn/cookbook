class User < ApplicationRecord 

has_many :recipes
has_many :reviews
has_secure_password 

validates :username, presence: true, unless: :uid?
validates :username, uniqueness: true
validates :email, presence: true, unless: :uid?
validates :email, uniqueness: true 
validates :password, presence: true

end 