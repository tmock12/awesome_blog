Feature: User views a blog post

  Scenario: User views individual blog post
    Given I am signed in
    And I have the following post:
      | Title   | How to Swim          |
      | Content | Dont breath in water |
    When I am on the home page
    And I follow "How to Swim"
    Then I should be on that posts page
    And I should see "How to Swim"
    And I should see a comment section

  Scenario: User views pretty url
    Given the following post:
      | Title        | How to Swim               |
      | Content      | Dont Breath in water      |
    When I am on the home page
    And I visit the "How to Swim" url
    Then I should be on that posts page
    And I should see "How to Swim"
