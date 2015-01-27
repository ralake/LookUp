Feature: Information page
  In order to use the app correctly
  As a solar-power curious person
  I want to read some introductory information.

  Scenario: As a user who wants to go to the next page
    Given that there is a roof and I am on the get started page
    When I read information I want to move to next page
    Then I should see the angle page
