@javascript
Feature: User register an log in
  As an user
  I want to register and log in
  So that I can see site's welcome page
  
  Scenario: user tries to log in with fake username and fails
    Given I am on login page
    When  I fill in "login" with "fake_man"
    And   I fill in "password" with "123456"
    And   I press "Log in"
    Then  I should see "Login and/or password not correct!" within "div#warning"
    
  Scenario: user tries to access page when not logged in and gets redirected to login page
    Given I am on login page
    When  I go to subjects page 
    Then  I should be on sessions page
    And   I should see "Please log in" within "div#warning"
    
  Scenario: user tries to register and gets some validation errors
    Given I am on login page
    When  I follow "Register"
    When  I fill in "User name" with "fake_man"
    When  I fill in "Password" with "fake_man"
    When  I fill in "Password confirmation" with "fake_man"
    When  I fill in "Full name" with "Fake man"
    When  I press "Create"
    Then  I should see "Email"
    And   I should see "is invalid"
    And   I should see "can't be blank"
    
  Scenario: user registers and successfully logs in
    Given I am on login page
    When  I follow "Register"
    When  I fill in "User name" with "fake_man"
    When  I fill in "Password" with "fake_man"
    When  I fill in "Password confirmation" with "fake_man"
    When  I fill in "Full name" with "Fake man"
    When  I fill in "Email" with "ingus.skaistkalns@inbox.lv"
    When  I press "Create"
    Then  I should see "User was successfully created"
    When  I fill in "login" with "fake_man"
    And   I fill in "password" with "fake_man"
    And   I press "Log in"
    Then  I should be on subjects page
