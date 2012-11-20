Feature: User edits a post

  Scenario: User edits an existing post
    Given I am signed in
    And I have the following post:
      | Title   | How to Breath |
      | Content | In and Out    |
    And I go to my dashboard
    When I follow "Edit Post"
    And I fill in the following:
      | Title | How to Eat |
    And I press "Update Post"
    Then I should be on the "dashboard" page
    And I should see "How to Eat"
    And I should see "Your post has been updated."
