Feature: Orientation 
  In order to use LookUp
  As a solar curious person
  I want to be able to check orientation of my roof

  @javascript
  Scenario: Orientation with phone
    Given I am on the orientation page
    When I am happy with my compass position
    Then I should proceed to the next step
