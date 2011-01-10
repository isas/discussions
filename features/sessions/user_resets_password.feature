Feature: User resets password and logs in with new password
  As an user
  I want to reset password and log in
  So that I can get new password 
  
  Scenario: user tries to reset his password with fake username and email and fails
    Given I am on login page
    When  I follow "Reset password"
    And   I fill in "login" with "fake_man"
    And   I fill in "email" with "fake_email"
    And   I press "Reset password"
    Then  I should see "User not found!" within "div#error"
    
  Scenario: user tries to reset his password with valid login and email and succeeds
    Given User skaising created
    And   I am on password reset page
    And   I fill in "login" with "skaising"
    And   I fill in "email" with "ingus@fakemail.com"
    And   I press "Reset password"
    Then  I should see "Password was reset successfully, Ingus Skaistkalns!" within "div#notice"