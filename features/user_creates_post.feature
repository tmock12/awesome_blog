Feature: User creates a post

  Scenario: User creates a post
    Given I am signed in
    And I am on the "dashboard" page
    When I follow "create new post"
    And I fill in the following:
      | Title       | How to Surf            |
      | Content     | Stand up on your board |
    And I press "Create Post"
    Then I should be on the "dashboard" page
    And I should see "How to Surf"
