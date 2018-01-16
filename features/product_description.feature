Feature: User can see product description on the restaurant show page
  As a user
  In order to get more information of the product
  I would like to see a description

  Background:
    Given the following restaurants exist
      | name              |
      | Thomas Kebabrulle |
      | Oliver's Burger   |
      | Borat's Palace    |

    Given the following products exist within a specific restaurant
      | name              | restaurant      | description      | price  | category    |
      | Chicken wings     | Oliver's Burger | Nice wings       | 50 kr  | Starter     |
      | Double Burger     | Oliver's Burger | Tasty fat burger | 150 kr | Main Course |
      | Apple pie         | Oliver's Burger | Sweet pie        | 65 kr  | Dessert     |

    Scenario:
      When I visit the "Oliver's Burger" show page
      Then show me the page
      Then I would like to see "Nice wings" under "Chicken wings" with a price of "50 kr"
      And I would like to see "Tasty fat burger" under "Double Burger" with a price of "150 kr"
      And I would like to see "Sweet pie" under "Apple pie" with a price of "65 kr"
