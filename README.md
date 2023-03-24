# Cookbook

## Description
Ruby on Rails application utilizing MVC structure and CRUD functionality for sharing and reviewing recipes. 

## Functionality

### Users:
-	Create accounts and sign in, and can also login with Github authorized through OmniAuth, authenticated through BCrypt. 
-	User index page displays a list of all users that link to individual profile pages, which display the recipes and reviews user created

### Recipes: 
-	Users create recipes that can be viewed by other users
-	Users can edit and delete only the recipes they created  
-	Recipe index page contains list of all recipes with options to filter by ingredient or user, and  sort by date, number of ingredients, and number of reviews 
-	Individual recipe show pages display a recipe’s ingredients, instructions, and reviews 

### Reviews: 
-	Users can create recipe reviews at the review index page nested under recipe 
-	Users can edit and delete only their own reviews 

## Relationships <a id="rel"></a>
##### [Back to Top](#top)
### User
```has_many :recipes```
```has_many :reviews```
### Recipe
```has_many :recipe_ingredients```
```has_many :ingredients, through: :recipe_ingredients```
```has_many :reviews```
### Ingredient
```belongs_to :user```
```has_many :recipe_ingredients```
```has_many :recipes, through: :recipe_ingredients```
### RecipeIngredient
```belongs_to :recipe```
```belongs_to :ingredient```
### Review
```belongs_to :recipe```
```belongs_to :user```

## Tech Stack
 - Ruby
 - Rails
 - SQLite
 - Active Record
 - OmniAuth
 - BCrypt
 - HTML and CSS 
 - Bootstrap

## Instructions 
 - Clone and cd repo
 -  run 'rails db:migrate'
 -  run 'rails s' to start the server
 -  Enter localhost:3000 in the browser

## Contributing

Bug reports and pull requests are welcome on Github at https://github.com/ashhhlynn/cookbook

## License

The gem is available as open source under the terms of the MIT License: https://opensource.org/licenses/MIT

## Author

Ashley 
