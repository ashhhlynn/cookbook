class Review < ApplicationRecord
    belongs_to :user
    belongs_to :recipe 

    validates :text, presence: true 
    validates(:text, { :length => { :maximum => 500 } })
    validates :user_id, presence: true
    validates :recipe_id, presence: true

    default_scope lambda {order("updated_at desc")} 

end 