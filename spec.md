# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) : Owner has_many Pets
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) : Pet belongs_to Owner
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) : Vet has_many Pets through Appointments
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) : Pet has_many Vets through Appointments
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) : date, time - appointment.date, appointment.time
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) : Vet, Appointment, Chart, Pet
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) : Appointment, Appointment.upcoming_appts_for_vet(vet), vet_path (/vets/25)
- [x] Include signup (how e.g. Devise) : signup form/route for vets in SessionsController
- [x] Include login (how e.g. Devise) : login form/route for vets in SessionsController
- [x] Include logout (how e.g. Devise) : logout route in SessionsController
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) : owners login via Github with OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes) : /vets/25/charts/3
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) : /vets/25/appointments/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) : /vets/25/appointments/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
