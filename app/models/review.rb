class Review < ApplicationRecord
    belongs_to :user
    belongs_to :recipe 

    validates :text, presence: true 
    validates(:text, { :length => { :maximum => 40 } })
    validates :user_id, presence: true
    validates :recipe_id, presence: true

end 