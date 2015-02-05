Feature: Selecting roof type
  In order to use LookUp
  As a solar curious person
  I want to be able to select the type of the roof

  Background: Using the app
    Given I visit the homepage
    When I decide to get started
    Then I should see the introductory page
    Given I am on the get started page
    Then I move on to the orientation page
    Given I am on the orientation page
    When I am happy with my compass position
    Then I should proceed to the next step

  @javascript
  Scenario: Selecting a flat roof 
    Given I am on the roof type page
    When I select flat roof
    Then I should see the photo page

  @javascript
  Scenario: Selecting a sloped roof
    Given I am on Roof Angle page
    When I select sloped roof
    Then I should see the roof angle page