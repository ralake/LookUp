Feature: Matching roof angle
  In order to use LookUp
  As a solar curious person
  I want to be able to match my phone with roof angle

  Background: Using the app
    Given I visit the homepage
    When I decide to get started
    Then I should see the first introductory page
    Given I am on the first information page
    Then I move on to the second information page
    Given I am on the orientation page
    When I am happy with my compass position
    Then I should proceed to the next step
    Given I am on Roof Angle page
    When I select sloped roof
    Then I should see the roof angle page

  @javascript
  Scenario: Matching roof angle
    Given I am on the roof angle page and matched angle
    Then I should move to photo page