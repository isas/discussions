@javascript
Feature: User register an log in
  As an user
  I want to register and log in
  So that I can see site's welcome page
  
  Scenario: user tries to log in with fake username and fails
    Given I am on login page
    When I fill in "login" with "fake_man"
    And I fill in "password" with "123456"
    And I press "Log in"
    Then I should see "Login and/or password not correct!" within "div#warnings"
