Feature: User signs out

  Scenario: User signs out of app
    Given I am signed in
    And I am on the "dashboard" page
    When I follow "sign out"
    Then I should be on the home page
    And I should see "Signed out!"
    And I should see "sign up / sign in"
    When I go to the "dashboard" page
    Then I should be on the home page
    And I should see "Please sign in"
