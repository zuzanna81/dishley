Feature: User can see restaurant sorted by categories
  As a user
  In order to choose type of food
  I would like to see restaurants sorted by categories

  Background:
    Given the following categories exist
      | name            |
      | Chinese         |
      | Thai            |
      | French          |
      | Italian         |

    And the following restaurants exist
      | name              |
      | Thomas Kebabrulle |
      | Oliver's Burger   |
      | Borat's Palace    |


  Scenario:
    When I visit the landing page
    Then show me the page
    Then I would like to see "Thomas Kebabrulle" in the "Chinese" category
    And I would like to see "Oliver's Burger" in the "Chinese" category
    And I would like to see "Borat's Palace" in the "Chinese" category
    # And I would like to see "Thai"
    # And I would like to see "French"
    # And I would like to see "Italian"
