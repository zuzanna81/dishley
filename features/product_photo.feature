Feature: User can see a product photo on the restaurant show page
  As a user
  In order to get a sense of the product
  I would like to see a picture of it

  Background:
    Given the following restaurants exist
      | name              |
      | Thomas Kebabrulle |
      | Oliver's Burger   |
      | Borat's Palace    |

    Given the following products exist within a specific restaurant
      | name              | restaurant      | description      | price  |
      | Chicken wings     | Oliver's Burger | Nice wings       | 50 kr  |
      | Double Burger     | Oliver's Burger | Tasty fat burger | 150 kr |
      | Apple pie         | Oliver's Burger | Sweet pie        | 65 kr  |

      Scenario:
        When I visit the "Oliver's Burger" show page
        Then I would like to see "Nice wings" under "Chicken wings" with a price of "50 kr"
        And I would like to see an image of "Chicken wings"
