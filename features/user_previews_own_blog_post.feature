Feature: User views their own blog post

  Scenario: User views their own blog post from dashboard
    Given I am signed in
    And I have the following post:
      | Title   | How to Ride a bike |
      | Content | Get on and pedal   |
    When I go to the "dashboard" page
    And I follow "Preview Post"
    Then I should be on that user posts page
    And I should see "How to Ride a bike"
    And I should see "Get on and pedal"
    And I should see "Published Status:"
