Feature: User can see product list on the restaurant show page
  As a user,
  In order to make a choice,
  I would like to see a restaurant's product list

  Background:
    Given the following restaurants exist
      |name             |
      |Thomas Kebabrulle|
      |Oliver's Burger  |
      |Borat's Palace   |

    Given the following products exist within a specific restaurant
      | name                    | restaurant      |
      | Chicken wings           | Oliver's Burger |
      | Double Burger           | Oliver's Burger |
      | Apple pie               | Oliver's Burger |

  Scenario:
    When I visit the "Oliver's Burger" show page
    Then I would like to see "Chicken wings"
    And I would like to see "Double Burger"
    And I would like to see "Apple pie"
