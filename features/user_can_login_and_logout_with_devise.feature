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

  Scenario: User fills in form [Happy Path]
    When I fill in "Email" with "me@mail.com"
    And I fill in "Password" with "whatever"
    And I click on "Log in" button
    Then I should be redirected to "landing" page
    And I should see "Logged in as: me@mail.com"
    And I should see "Signed in successfully."

  Scenario: User does not fill in Email [Sad Path]
    When I fill in "Password" with "whatever"
    And I click on "Log in" button
    Then I should see "Invalid Email or password."

  Scenario: User does not fill in Password [Sad Path]
    When I fill in "Email" with "me@mail.com"
    And I click on "Log in" button
    Then I should see "Invalid Email or password."

  Scenario: User does not fill in email or password [Sad Path]
    When I click on "Log in" button
    Then I should see "Invalid Email or password."
