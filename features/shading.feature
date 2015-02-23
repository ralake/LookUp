Feature: Shading
  In order to give information about the shading of my roof
  As a person with a view of the roof in question
  I want to get some information and enter the data

  @javascript
  Scenario: Assessing potential roof shading
    Given I am on shading page
    When I choose a shade value
    Then I should see the measurements page
