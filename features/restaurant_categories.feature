Feature: User can see restaurant sorted by categories
  As a user
  In order to choose type of food
  I would like to see restaurants sorted by categories

  Background:
    Given the following categories exist
      | name            |
      | Chinese         |
      | French          |
      | Italian         |

    And the following restaurants within categories exist
      | name               | category |
      | Thomas Kebabrulle  | Chinese  |
      | Oliver's Burger    | Chinese  |
      | Borat's Palace     | French   |
      | Lisa's Bistro      | French   |
      | Franchesco's Pasta | Italian  |
      | Mama's Pizza       | Italian  |

  Scenario:
    When I visit the landing page
    Then show me the page
    Then I would like to see "Thomas Kebabrulle" in the "Chinese" category
    And I would like to see "Oliver's Burger" in the "Chinese" category
    And I would like to see "Borat's Palace" in the "French" category
    And I would like to see "Lisa's Bistro" in the "French" category
    And I would like to see "Franchesco's Pasta" in the "Italian" category
    And I would like to see "Mamma's Pizza" in the "Italian" category
