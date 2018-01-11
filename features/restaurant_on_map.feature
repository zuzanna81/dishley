Feature: Showing restaurants on map
  As a user,
  In order to pick a restaurant,
  I would like to see them pointed out on a map

  Background:
    Given the following restaurants exist
      |name             |
      |Thomas Kebabrulle|
      |Oliver's Burger  |
      |Borat's Palace   |
  @javascript
  Scenario:
    When I visit the landing page
    Then I should see the map
    And I should see 3 markers
