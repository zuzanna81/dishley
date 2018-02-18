# Dishley

Week 8-9-10 project for Craft Academy October 2017 Cohort.  
For this project we switched teams and worked on legacy code and new implementations
on the app of another team.  
In the final days we started building a mobile client for the app with Ionic and Angular  
you can check it here https://github.com/CraftAcademy/dishley_client.

## Description

This app will automatically show restaurants nearby your position.  
When you visit the site(https://jak-sie-masz-slowfood.herokuapp.com/) your
location is tracked down and positioned at the center of the map.  
Due to demonstration purposes there are two locations with restaurants available,
Gothenburg and Stockholm.  
If you want to test this app from another location you can
download a Chrome extension to change your geolocation(e.g. http://bit.ly/2C46jhs).  
If you are or choose to be in Gothenburg three restaurants will show up nearby your location
with categories(in this case _italian_ and _thai_) and restaurants' names. When you click
on the restaurant **Bov** you'll be able to see the structure of a restaurant's template
page with menus, submenus, dishes' name, description and price and a the `Add to Order` button.  
If you are or choose to be in Stockholm the same features are available for **Brasserie Balzac**.  
When you add dishes to your order, an `Order` link will appear in the navbar.  
You'll be able to see the total summary and perform a simulated transaction with Stripe.  
User authentication is available too via `Sign up`, if you are a first time visitor,  
or via `Log in` if you're an already registered user.

## Contributors
* Francesco Falchi: https://github.com/NegativeKarma
* Lisa Eriksson: https://github.com/lcegit
* Sophie Sjöberg: https://github.com/sophiesjoberg
* Oliver Ochman: https://github.com/oliverochman/

During the first week and a half of the project the team had two different members
replaced by me and Sophie,
they were:
* Alfred Johansson: https://github.com/aljoh
* Zuzanna Bienkowska: https://github.com/zuzanna81/

## Technologies
* Ruby on Rails
* geocoder
* rails-assets-gmaps
* Bootstrap
* Sass
* jquery-rails
* acts_as_shopping_cart
* stripe-rails
* state_machine
* Devise
* devise_token_auth
* Coffee rails
* dotenv-rails
* haml
* active_model_serializers
* rack-cors

## Installation
Download the ZIP file from this repo
Unzip the file and then open it up via your terminal
Run `bundle install`, after run `rails db:create db:migrate`
Run `rails s` and go to http://localhost:3000/

## Testing
* Cucumber
* RSpec
* Pry
* Factory Bot
* Faker
* Launchy
* Selenium
* Shoulda Matchers
* email_spec
* coveralls
* webmock
* stripe-ruby-mock
* state_machines-rspec

### Acceptance test
Acceptance test are written in Cucumber using Capybara and Selenium with Chrome Driver in headless state.

Features are stored in `./features`

To run the acceptance test suite, execute Cucumber in you terminal:

```bash
$ cucumber
```

### Unit tests
Unit test are written in rspec

```bash
$ rspec
```

#### Active Models
Active Record Models are tested using RSpec (model specs)

We are using Shoulda matchers to test the expected database tables, validations and permissions.
We are also allowing, via validations, the objects created by FactoryBot to be tested
