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

  Scenario: User creates a post and sets a publish time
    Given I am signed in
    And I am on the "dashboard" page
    When I follow "create new post"
    And I fill in the following:
      | Title   | Not Yet Published      |
      | Content | Stand up on your board |
    And I select "12/10/2017" as the date
    And I press "Create Post"
    When I visit the home page
    Then I should not see "Not Yet Published"

  Scenario: Users creates a post and uploads an image
    Given I am signed in
    And I am on the "dashboard" page
    When I follow "create new post"
    And I fill in the following:
      | Title   | Post with Image                 |
      | Content | How to set a post with an image |
    And I attach the file at "features/support/test-image.jpg" to "Attached image"
    And I press "Create Post"
    Then I should be on the "dashboard" page
    When I follow "AWESOME BLOG"
    Then I should see the image "test-image.jpg"
