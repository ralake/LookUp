Feature: Selecting roof type
  In order to use LookUp
  As a solar curious person
  I want to be able to select the type of the roof

  @javascript
  Scenario: Selecting a flat roof 
    Given I am on the roof type page
    When I select flat roof
    Then I should see the photo page

  @javascript
  Scenario: Selecting a sloped roof
    Given I am on the roof type page
    When I select sloped roof
    Then I should see the roof angle page