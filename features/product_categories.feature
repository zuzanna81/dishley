Feature: User can see products sorted by categories
  As a user
  In order to choose more easily
  I would like to see the products sorted in categories

  Background:
    Given the following restaurants exist
      | name              |
      | Thomas Kebabrulle |
      | Oliver's Burger   |
      | Borat's Palace    |

    Given the following products exist within a specific restaurant and category
      | name              | restaurant      | category    |
      | Chicken wings     | Oliver's Burger | Starter     |
      | Double Burger     | Oliver's Burger | Main Course |
      | Apple pie         | Oliver's Burger | Dessert     |
      | Apple pie         | Borat's Palace  | Starter     |

    Scenario:
      When I visit the "Oliver's Burger" show page
      Then I would like to see "Chicken wings" under the "Starter" category
      And I would like to see "Double Burger" under the "Main Course" category
      And I would like to see "Apple pie" under the "Dessert" category
      And I would not like to see "Apple pie" under the "Starter" category
