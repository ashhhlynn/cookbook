class CreateReviews < ActiveRecord::Migration[5.2]
    def change
      create_table :reviews do |t|
        t.string :text
        t.integer :user_id
        t.integer :recipe_id 
  
        t.timestamps 
      end
    end
  end