Feature: User can view list of nearby restaurants
  As a user,
  In order to see nearest restaurants,
  I would like to select restaurants from a list

  Background:
    Given the following restaurants exist
    | name              | street_address    | city      |
    | Thomas Kebabrulle | Drottninggatan 1  | Göteborg  |
    | Oliver's Burger   | Kungsgatan 1      | Göteborg  |
    | Zuzanna's Pizza   | Brinellvägen 8    | Stockholm |

    #And I am in Stockholm
  And I am at latitude: "59.33", longitude: "18.05"

  Scenario:
    When I visit the landing page
    And the map has been loaded
    Then the center of the map should be approximately "59.334591" lat and "18.063240" lng
    Then I would like to see "Zuzanna's Pizza"
    And I would not like to see "Oliver's Burger"
