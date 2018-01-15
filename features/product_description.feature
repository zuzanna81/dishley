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
      | name              | restaurant      | description      |
      | Chicken wings     | Oliver's Burger | Nice wings       |
      | Double Burger     | Oliver's Burger | Tasty fat burger |
      | Apple pie         | Oliver's Burger | Sweet pie        |

    Scenario:
      When I visit the "Oliver's Burger" show page
      Then I would like to see "Chicken wings"
      And I would like to see "Nice wings"
      And I would like to see "Double Burger"
      And I would like to see "Tasty fat burger"
      And I would like to see "Apple pie"
      And I would like to see "Sweet pie"
