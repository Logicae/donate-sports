# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - Two classes meet this spec (User and Sport)
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - See Product
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - Product is a join table for User and Sport
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) - See Product
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - See class level validations
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - See self.sort_by_sport in Sport
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) - See Sport class for writer and Sports _form partial for nested form
- [x] Include signup (how e.g. Devise) - bcrypt and sessions
- [x] Include login (how e.g. Devise) - bcrypt and sessions
- [x] Include logout (how e.g. Devise) - bcrypt and sessions
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - OmniAuth (GitHub)
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - sports/1/products
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - sports/1/products/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - see signup and new product

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate