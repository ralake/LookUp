Feature: Shading
  In order to give information about the shading of my roof
  As a person with a view of the roof in question
  I want to get some information and enter the data

  xScenario: Assessing potential roof shading
    Given that there is a roof and I am on shading page
    When I choose a shade value
    Then I should see the roof angle page

  xScenario: Getting information on the impact of shading
    Given I am on the shading page
    And I need more information
    Then I should see Tom's information about shading impact
