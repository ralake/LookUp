Feature: Information page
  In order to use the app correctly
  As a solar-power curious person
  I want to read some introductory information.

  Background: Visiting the homepage
    Given I visit the homepage
    When I decide to get started
    Then I should see the introductory page

  @javascript
  Scenario: As a user who wants to go to the next page
    Given I am on the get started page
    Then I move on to the orientation page
