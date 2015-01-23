Feature: Shading
  In order to give information about the shading of my roof
  As a person with a view of the roof in question
  I want to get some information and enter the data

  Background: Visiting the homepage
    Given I visit the homepage
    When I decide to get started
    Then I should see the introductory page

  Scenario: Assessing potential roof shading
    Given I am on shading page
    When I choose a shade value
    Then I should see the roof angle page

  Scenario: Getting information on the impact of shading
    Given I am on the shading page
    And I need more information
    Then I should see Tom's information about shading impact

