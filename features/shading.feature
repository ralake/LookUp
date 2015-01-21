Feature: Shading
  In order to give information about the shading of my roof
  As a person with a view of the roof in question
  I want to get some information and enter the data

  Background: Selecting roof material
    Given I am on the material page
    When I choose a roof material
    Then I should see the shading page

  Scenario: Assessing potential roof shading
    Given I am on shading page
    When I choose a shade value
    Then I should see the roof angle page

  Scenario: Getting information on the impact of shading
    Given I am on the shading page
    And I need more information
    Then I should see Tom's information about shading impact

