Feature: Shading
  In order to find give information about the shading of my roof
  As a user of look up
  I want to get some information and enter the data

  Scenario: Assessing shade
    Given I am on shading page
    When I choose shade value
    Then I should see roof angle page

  Scenario: Getting information on the impact of shading
    Given I am on the shading page
    And I need more information
    Then I should see Tom's information

