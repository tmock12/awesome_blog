Feature: User sessions

  Scenario: User signs up/in
    Given I am logged into Twitter as the following user:
          | uid      | 12345       |
          | nickname | FunkyMonkey |
    And I am on the home page
    When I follow "sign up / sign in"
    Then I should be on the home page
    And I should see "signed in as FunkyMonkey"
    And I should see "Signed in!"
