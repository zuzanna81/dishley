Feature: User can login and logout
  As a user
  In order to make it easier to place an order
  I need to be able to log in with my credentials and be able to logout

  Background:
    Given the following user exists
       | email                | password    | password_confirmation |
       | me@mail.com          | whatever    | whatever              |
    When I visit the landing page
    And I click on "Log in" link

  Scenario: Visitor fills in all fields [Happy Path]
    When I fill in "Email" with "me@hotmail.com"
    And I fill in "Password" with "cutie123"
    And I click on "Log in" button
    Then I should be redirected to the "Landing" page
    And I should see "Logged in as: me@mail.com"
    And I should see "Signed in successfully."
