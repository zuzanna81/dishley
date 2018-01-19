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
      | name              | restaurant      | description      | price  | category    |
      | Chicken wings     | Oliver's Burger | Nice wings       | 50 kr  | Starter     |
      | Double Burger     | Oliver's Burger | Tasty fat burger | 150 kr | Main Course |
      | Apple pie         | Oliver's Burger | Sweet pie        | 65 kr  | Dessert     |

    @googlemap
    Scenario:
      When I visit the "Oliver's Burger" show page
      Then I would like to see "Nice wings" under "Chicken wings" with a price of "50 kr"
      And I would like to see an image for "Chicken wings"
