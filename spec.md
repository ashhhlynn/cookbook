Specs:
- [x] Using Ruby on Rails for the project: 
In my Rakefile I put: 
Rails.application.load_tasks

In my Config.ru I put:
run Rails.application
Rails.application.load_server

In Application.rb I put:
Bundler.require(*Rails.groups)

module Cookbook
  class Application < Rails::Application

In my Config Environment.rb I put:
Rails.application.initialize!


- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes):
A User has many Reviews and Recipes.
A Recipe has many RecipeIngredients.
An Ingredient has many RecipeIngredients. 

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User):
A Review belongs to a User and Recipe. 
A Recipe belongs to a User.
A RecipeIngredient belongs to a Recipe and Ingredient. 

- [x] Include at least one has_many through relationship (x has_many y through z; e.g. Recipe has_many Items through Ingredients):
A Recipe has many Ingredients through RecipeIngredients, and an Ingredient has many Recipes through RecipeIngredients. 

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients):
See above

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients):
See above 

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity):
A Recipe Ingredient has a quantity attribute. 

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item):
User: A User must have a username present and unique, an email present and unique, a password present and further validated through has_secure_password. 
Recipe: A Récipe must have a name and description present and be under the max length, must have RecipeIngredients present, Image URL present and a valid Image URL, a RecipeIngredient quantity cannot be blank, and an Ingredient name cannot be blank (I rejected through nested attributes). 
RecipeIngredient: A RecipeIngredient must have a quantity present and be under the maximum length, and a Recipe and Ingredient must be present. 
Ingredient: An Ingredient must have a name present and under the maximum length. 
Review: A Review must have a user_id and recipe_id present, and text present and under the maximum length. 

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes):
In my Recipe model, I have a self.by_user(user_id) method that takes in a user_id and filters the recipes by user, a self.most_recent method that reorders the recipes by created date descending, a self.reviews_count that reorders the recipes by the number of reviews it has descending, a self.ingredients_count method that reorders the recipes by the number of RecipeIngredients it has. My Index method in the Recipes Controller calls on these methods. 

- [x] Include signup (how e.g. Devise):
I have a User new and create method in the Users controller that renders the new view which has a signup form. I created routes:  get '/signup', to: 'users#new' and post '/signup', to: 'users#create'. A User can also login through Github which I created through an OmniAuth app, which creates a new user. 

- [x] Include login (how e.g. Devise):
I have a new and create method in the Sessions controller that renders the sessions new view with the login form. I created routes: get '/login', to: 'sessions#new' and post '/login', to: 'sessions#create'. A User can also login through Github which I created through an OmniAuth app, which creates a new session. 

- [x] Include logout (how e.g. Devise):
I have a destroy method in the Sessions controller, and I created a route: post '/logout', to: 'sessions#destroy', which logs a User out. 

- [x] Include third party signup/login (how e.g. Devise/OmniAuth):
I created an Omniauth app through Github that allows a User to login through Github. This creates a User from the uid, which is one of the User attributes. In my Sessions create method there’s an if auth, which finds or creates this User from Github, and sets the session user ID to that user’s ID. I also created an omniauth file in Config initializers, and private auth method in the Sessions controller. 

- [x] Include nested resource show or index (URL e.g. users/2/recipes):
I have a reviews index nested under recipes (URL recipes/2/reviews).

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new):
I have a nested reviews new form under recipes (and edit form as well). 

- [x] Include form display of validation errors (form URL e.g. /recipes/new):
I have displayed validation errors in my new and edit Recipe forms, my new User form, and my new and edit Review forms. 

Confirm:
- [x] The application is pretty DRY:
I tried to make it as DRY as possible.
- [x] Limited logic in controllers
I tried to use as limited logic as possible. 
- [x] Views use helper methods if appropriate:
I used current_user in the Reviews index & Application index, recipe_owned in the Recipe show page. I also used helper methods in many of the before_actions for the views. 
- [x] Views use partials if appropriate:
I have a partial form for my new and edit Recipe views, and a partial form for my new and edit Review views. I also created a Recipe partial, that my Recipe show view and User show view uses. 
