Feature: User deletes a post

  @javascript
  Scenario: User deletes an existing post
    Given I am signed in
    And I have the following post:
      | Title   | How to Breath |
      | Content | In and Out    |
    And I go to my dashboard
    When I follow "Delete Post"
    And I confirm
    Then I should be on the "dashboard" page
    And I should not see "In and Out"
    And I should see "Your post has been deleted"
