Feature: Orientation 
  In order to use LookUp
  As a solar curious person
  I want to be able to check orientation of my roof

  Background: Using the app
    Given I visit the homepage
    When I decide to get started
    Then I should see the first introductory page
    Given I am on the first information page
    Then I move on to the second information page

  @javascript
  Scenario: Orientation with phone
    Given I am on the orientation page
    When I am happy with my compass position
    Then I should proceed to the next step
