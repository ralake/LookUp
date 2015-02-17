Feature: First Information page
  In order to use the app correctly
  As a solar-power curious person
  I want to read some introductory information.

  @javascript
  Scenario: As a user who wants to go to the next page
    Given I am on the first information page
    Then I move on to the second information page
