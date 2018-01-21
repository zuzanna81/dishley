Feature: User can see a product photo on the restaurant show page
  As a user
  In order to get a sense of the product
  I would like to see a picture of it

  Background:
    Given the following restaurants exist
      | name              | street_address    | city     |
      | Thomas Kebabrulle | Drottninggatan 1  | Göteborg |
      | Oliver's Burger   | Kungsgatan 1      | Göteborg |
      | Borat's Palace    | Östra Hmangatan 1 | Göteborg |

    Given the following products exist within a specific restaurant
    | name          | restaurant      | description      | category    | price | image_file_link                    |
    | Chicken wings | Oliver's Burger | Nice wings       | Starter     | 50 kr | http://www.example.com/image.jpg   |
    | Double Burger | Oliver's Burger | Tastiest burger  | Main        | 50 kr | http://www.example.com/image       |

  @googlemap
  Scenario:
    When I visit the "Oliver's Burger" show page
    Then I would like to see "Nice wings" under "Chicken wings" with a price of "50.0 kr"
    And I would like to see an image for "Chicken wings"
    And I would not like to see an image for "Double Burger"
