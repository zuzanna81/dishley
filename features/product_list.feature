Feature: User can see product list on the restaurant show page
  As a user,
  In order to make a choice,
  I would like to see a restaurant's product list

  Background:
    Given the following products exist within a specific restaurant
      | product       | restaurant      |
      | Chicken wings | Oliver's Burger |
      | Oliver Burger | Oliver's Burger |
      | Apple pie     | Oliver's Burger |

  Scenario:
    When I visit the "Oliver's Burger" show page
    Then I would like to see "Chicken wings"
    And I would like to see "Oliver's Burger"
    And I would like to see "Apple pie"
