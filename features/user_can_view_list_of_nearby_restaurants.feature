@javascript
Feature: User can view list of nearby restaurants
  As a user,
  In order to see nearest restaurants,
  I would like to select restaurants from a list

  Background:
    Given the following categories exist
      | name    |
      | Chinese |
      | French  |
      | Italian |

    And the following restaurants within categories exist
      | name              | street_address   | city      | category | description   |
      | Zuzanna's Pizza   | Centralplan 15   | Stockholm | Italian  | Food is tasty |
      | Zuzanna's Pizza 2 | Centralplan 15   | Stockholm | Chinese  | Food is tasty |
      | Zuzanna's Pizza 3 | Centralplan 15   | Stockholm | Chinese  | Food is tasty |
      | Thomas Kebabrulle | Drottninggatan 1 | Göteborg  | Chinese  | Food is tasty |
      | Oliver's Burger   | Kungsgatan 1     | Göteborg  | Chinese  | Food is tasty |

    And I am at latitude: "59.334591", longitude: "18.063240"

  @googlemap
  Scenario:
    When I visit the landing page
    And the map has been loaded
    Then the center of the map should be approximately "59.334591" lat and "18.063240" lng
    Then I would like to see "Zuzanna's Pizza" in the "Italian" category
    And I would like to see "Zuzanna's Pizza 2" in the "Chinese" category
    And I would like to see "Zuzanna's Pizza 3" in the "Chinese" category
    #Then show me the page
    And I would not like to see "Oliver's Burger" in the "Chinese" category
    And I would not like to see "Thomas Kebabrulle" in the "Chinese" category
