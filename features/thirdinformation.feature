Feature: Third Information page
  In order to use the app correctly
  As a solar-power curious person
  I want to read the last bit of introductory information.

  Background: Using the app
    Given I visit the homepage
    When I decide to get started
    Then I should see the first introductory page
    Given I am on the first information page
    Then I move on to the second information page
    Given I am on the second information page
    Then I move on to the third information page

  @javascript
  Scenario: As a user who wants to go to the next page
    Given I am on the third information page
    Then I move on to the orientation page