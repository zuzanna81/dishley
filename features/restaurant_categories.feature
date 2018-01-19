@javascript
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
      | name              | street_address    | city     | category | description   |
      | Thomas Kebabrulle | Drottninggatan 1  | Göteborg | Chinese  | Food is tasty |
      | Oliver's Burger   | Kungsgatan 1      | Göteborg | French   | Food is tasty |
      | Borat's Palace    | Östra Hmangatan 1 | Göteborg | Italian  | Food is tasty |

    And I am at latitude: "57.7", longitude: "11.9"

  @googlemap
    Scenario:
      When I visit the landing page
      Then I would like to see "Thomas Kebabrulle" in the "Chinese" category
      And I would like to see "Oliver's Burger" in the "French" category
      And I would like to see "Borat's Palace" in the "Italian" category
      Then I would not like to see "Thomas Kebabrulle" in the "French" category
      And I would not like to see "Oliver's Burger" in the "Chinese" category
      And I would not like to see "Borat's Palace" in the "French" category
