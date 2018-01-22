Feature: User signup
  As a user
  In order to have an account on the site
  I would like to be able to register

  Background:
    Given I visit the landing page
    And I click on "Sign up" link

  Scenario: User successfully regeisters an account [Happy Path]
    When I fill in "Email" with "oliver.ochman@hotmail.com"
    And I fill in "Password" with "whatever"
    And I fill in "Password confirmation" with "whatever"
    And I click on "Sign up" button
    And I should see "Welcome! You have signed up successfully."

  Scenario: User does not fill in Email field [Sad Path]
    When I fill in "Password" with "whatever"
    And I fill in "Password confirmation" with "whatever"
    And I click on "Sign up" button
    Then I should see "1 error prohibited this user from being saved: Email can't be blank"
